import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/widgets/login/rounded_textfield.dart';
import '../../provider/auth.dart';
import '../../utilities/size_config.dart';
import '../../widgets/shared/logo.dart';
import '../../widgets/shared/rounded_rectangle_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String localsIsoCountryCode;

  @override
  void initState() {
    // init country code by device locals
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    localsIsoCountryCode = systemLocales.first.countryCode ?? "SA";
    final auth = Provider.of<Auth>(context, listen: false);
    auth.setIsoCountryCode = localsIsoCountryCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Auth auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const Logo(),
          Text(
            ' Mobile',
            style: Theme.of(context).textTheme.headline3,
          ),
          RoundedTextField(
              prefixIcon: CountryCodePicker(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                onInit: (key) {
                  auth.setCountryKey = key?.dialCode ?? "+966";
                },
                onChanged: (key) {
                  auth.setIsoCountryCode = key.code ?? "SA";
                  auth.setCountryKey = key.dialCode ?? "+966";
                },
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: auth.isoCountryCode,
                favorite: const ['+966', 'SA'],
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              hintText: 'Enter your mobile number here',
              maxLength: 12,
              keyboardType: TextInputType.phone,
              validator: (text) {
                if (text!.length < 9) {
                  return "Please enter a valid mobile number";
                }
                return null;
              },
              controller: auth.phoneController,
              formKey: auth.phoneFormKey),
          RoundedRectangleButton(
              title: 'Start',
              onPressed: () async {
                if (auth.phoneFormKey.currentState?.validate() ?? false) {
                  bool isValid = await auth.phoneValidation();
                  if (!mounted) return;
                  if (isValid) {
                    Navigator.pushNamed(context, "/VerifyOtp");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Please enter a valid mobile number",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.red));
                  }
                }
              }),
        ],
      ),
    ));
  }
}
