import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final bool isSelected;
  const BottomNavItem(
      {Key? key,
      required this.onPressed,
      required this.isSelected,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              size: 30,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
        ],
      ),
    );
  }
}
