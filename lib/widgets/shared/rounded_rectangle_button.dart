import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final String title;
  final Function? onPressed;

  const RoundedRectangleButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return RawMaterialButton(
      constraints: BoxConstraints.tight(const Size(320, 55)),
      onPressed: onPressed == null
          ? null
          : () {
              onPressed!();
            },
      elevation: 00.0,
      splashColor: color,
      focusElevation: 0,
      highlightColor: color,
      fillColor: onPressed == null ? Colors.grey : color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
