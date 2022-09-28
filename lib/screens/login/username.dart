import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/provider/user_provider.dart';
import '../../widgets/login/rounded_textfield.dart';
import '../../widgets/shared/logo.dart';
import '../../widgets/shared/rounded_rectangle_button.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.usernameController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const Logo(),
          Text(
            ' What’s your name?',
            style: Theme.of(context).textTheme.headline3,
          ),
          RoundedTextField(
            hintText: 'Please Enter your name here',
            maxLength: 30,
            keyboardType: TextInputType.text,
            validator: (text) {
              if (text.length < 2) {
                return "Please enter a valid name";
              }
              return null;
            },
            controller: userProvider.usernameController,
            formKey: formKey,
          ),
          RoundedRectangleButton(
              title: 'Done',
              onPressed: () async {
                bool status;
                if (formKey.currentState?.validate() ?? false) {
                  status = await userProvider.postingUsername(context: context);
                  if (!mounted) return;
                  if (status) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/Home", (Route<dynamic> route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "An unexpected error occurred, please try again",
                        textAlign: TextAlign.center,
                      ),
                    ));
                  }
                }
              }),
        ],
      ),
    ));
  }
}
