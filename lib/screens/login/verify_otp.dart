// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/widgets/shared/logo.dart';
import '../../provider/auth.dart';
import '../../widgets/login/pin_code_fields.dart';
import '../../widgets/shared/rounded_rectangle_button.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  void initState() {
    final Auth auth = Provider.of<Auth>(context, listen: false);
    auth.otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              const Logo(padding: EdgeInsets.symmetric(vertical: 80)),
              SizedBox(
                width: 250,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Please enter the OTP sent to',
                      style: Theme.of(context).textTheme.headline3,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "\n ${auth.countryKey}${auth.phoneController.text}",
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ]),
                ),
              ),
              PinCodeFields(onCompleted: () async {
                await loginAction(auth: auth);
              }),
              RoundedRectangleButton(
                  title: 'Check',
                  onPressed: () async {
                    if (auth.otpController.text.length == 4) {
                      await loginAction(auth: auth);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "Please enter a valid OTP",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red));
                    }
                  }),
            ],
          ),
        ));
  }

  Future<void> loginAction({required Auth auth}) async {
    int status = 0;
    status = await auth.login(context: context);
    if (status == 201) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          auth.user?.userStatus == "new" ? '/Username' : "/Home",
          (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            status == 401
                ? "Your OTP is invalid"
                : "An unexpected error occurred, please try again",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red));
    }
  }
}
