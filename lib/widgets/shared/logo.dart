import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final EdgeInsets padding;
  const Logo(
      {Key? key, this.padding = const EdgeInsets.only(top: 170.0, bottom: 120)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        'assets/images/logo.png',
        width: 200,
        height: 50,
      ),
    );
  }
}
