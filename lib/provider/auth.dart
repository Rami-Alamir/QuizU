import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../repository/login_repository.dart';
import '../widgets/shared/indicator_dialog.dart';

class Auth with ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  SharedPreferences? _prefs;
  String? _isoCountryCode;
  String? _countryKey;
  String? _token;
  String? _otp;
  BuildContext? _dialogContext;
  UserData? user;
  bool? _isValid;
  String? get token => _token;
  String? get isoCountryCode => _isoCountryCode;
  String? get countryKey => _countryKey;
  bool? get isValid => _isValid;

  set setIsoCountryCode(String value) {
    _isoCountryCode = value;
  }

  set setToken(String? value) {
    _token = value;
  }

  set setCountryKey(String value) {
    _countryKey = value;
  }

  set otp(String value) {
    _otp = value;
  }

  Future<int> login({required BuildContext context}) async {
    dynamic response;
    _dialogContext = context;
    _showDialogIndicator(context);
    try {
      response = await LoginRepository()
          .login({"OTP": _otp, "mobile": "$countryKey${phoneController.text}"});
      if (response!.statusCode == 201) {
        try {
          user = UserData.fromJson(json.decode(response.body.toString()));
          _token = user?.token;
          notifyListeners();
          await _initPrefs();
          _prefs!.setString('token', _token!);
        } catch (_) {}
      }
    } catch (_) {}
    Navigator.pop(_dialogContext!);
    return response?.statusCode ?? 404;
  }

  // init Shared Preferences
  Future<void> _initPrefs() async {
    _prefs = _prefs ?? await SharedPreferences.getInstance();
  }

  // used to check phone number
  Future<bool> phoneValidation() async {
    try {
      String phoneNumber = "$countryKey${phoneController.text.trim()}";
      _isValid = await PhoneNumberUtil().validate(
        phoneNumber,
      );
    } catch (_) {
      _isValid = false;
    }
    return _isValid!;
  }

  void logout() async {
    await _initPrefs();
    _prefs!.remove('token');
    _token = null;
    user = null;
    _isValid = null;
    _otp = null;
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }

  // show indicator dialog
  void _showDialogIndicator(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dialogContext = context;
          return const IndicatorDialog();
        });
  }
}
