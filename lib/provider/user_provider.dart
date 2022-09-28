import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizu/models/user_score.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../repository/user_repository.dart';
import '../widgets/shared/indicator_dialog.dart';

class UserProvider with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();

  BuildContext? _dialogContext;
  UserData? _user;
  bool _isLoading = true;
  bool _retry = false;
  String? _token;

  List _myScores = [];

  void addNewScore(UserScore userScore) {
    _myScores.insert(0, userScore);
    setMyScores();
  }

  bool get isLoading => _isLoading;
  bool get retry => _retry;
  UserData? get user => _user;
  List get myScoresList => _myScores;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //used when auth provider changed
  void updateUserData(String? token) {
    _token = token;
    if (_token == null) {
      _user = null;
    } else if (_token != null) {
      getUserData();
      getMyScores();
    }
  }

  Future<bool> postingUsername({required BuildContext context}) async {
    int? responseStatusCode;
    _dialogContext = context;
    _showDialogIndicator(context);
    try {
      responseStatusCode = await UserRepository().postingUsername(
          "Bearer $_token", {"name": usernameController.text.trim()});
      Navigator.pop(_dialogContext!);
      if (responseStatusCode == 201) {
        try {
          _user = UserData();
          _user?.name = usernameController.text.trim();
          return true;
        } catch (_) {}
      }
    } catch (_) {
      Navigator.pop(_dialogContext!);
    }
    return false;
  }

  // get getTopScores list
  Future<void> getUserData({bool isLoading = true}) async {
    _isLoading = isLoading;
    _retry = false;
    try {
      _user = UserData();
      _user = await UserRepository().getUserData("Bearer $_token");
    } catch (_) {
      _retry = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  // do not use it
  Future<void> setMyScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('scoreList', jsonEncode(_myScores));
  }

  // do not use it
  Future<void> getMyScores() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('scoreList') ?? '[]';
    _myScores = (jsonDecode(jsonData) as List)
        .map((p) => UserScore.fromJson(p))
        .toList();
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
