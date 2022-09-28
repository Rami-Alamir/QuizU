import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final int maxLength;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final Function validator;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const RoundedTextField(
      {super.key,
      this.prefixIcon,
      required this.hintText,
      required this.maxLength,
      required this.keyboardType,
      required this.validator,
      required this.controller,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 22),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Form(
            key: formKey,
            child: TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(height: 1.5),
              onTap: () {
                formKey.currentState?.reset();
              },
              validator: (text) => validator(text),
              decoration: InputDecoration(
                enabled: true,
                prefixIcon: prefixIcon,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.headline4,
                counterText: "",
                contentPadding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 20, top: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.red, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1)),
                focusColor: Theme.of(context).primaryColor,
              ),
            ),
          )),
    );
  }
}
