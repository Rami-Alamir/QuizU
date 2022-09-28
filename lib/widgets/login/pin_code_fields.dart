import 'package:flutter/material.dart';
import '../../provider/auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PinCodeFields extends StatelessWidget {
  final Function onCompleted;
  const PinCodeFields({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25),
          child: Center(
            child: SizedBox(
              width: 250,
              child: PinCodeTextField(
                appContext: context,
                controller: auth.otpController,
                pastedTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textStyle: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(height: 2.1),
                length: 4,
                autoFocus: true,
                obscureText: false,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  errorBorderColor: Theme.of(context).primaryColor,
                  inactiveColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  activeColor: Theme.of(context).primaryColor,
                  inactiveFillColor: Theme.of(context).backgroundColor,
                  selectedFillColor: Theme.of(context).backgroundColor,
                  selectedColor: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).backgroundColor,
                  activeFillColor: Colors.white,
                ),
                cursorColor: Theme.of(context).primaryColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 0,
                  )
                ],
                onCompleted: (v) async {
                  await onCompleted();
                },
                onChanged: (value) {
                  auth.otp = value;
                },
                beforeTextPaste: (text) {
                  return true;
                },
              ),
            ),
          )),
    );
  }
}
