import 'package:flutter/material.dart';

class LeaderboardCircle extends StatelessWidget {
  final String name;
  final Widget child;
  final double scaleFactor;

  const LeaderboardCircle(
      {Key? key,
      required this.name,
      required this.child,
      required this.scaleFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Container(
                    width: scaleFactor == 1 ? 50 : 100,
                    height: scaleFactor == 1 ? 50 : 100,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        shape: BoxShape.circle),
                    child: Center(child: child)),
              ),
              SizedBox(
                  width: scaleFactor == 2 ? 90 : 50,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.white,
                        fontSize: scaleFactor == 2 ? 16 : 14,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
