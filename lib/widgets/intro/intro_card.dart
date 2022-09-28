import 'package:flutter/material.dart';
import '../../models/intro_list.dart';

class IntroCard extends StatelessWidget {
  final int mSelectedPosition;

  const IntroCard({Key? key, required this.mSelectedPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              IntroList.introData[mSelectedPosition].image!,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(IntroList.introData[mSelectedPosition].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1)),
            Container(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(IntroList.introData[mSelectedPosition].subtitleEn!,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.headline4)),
          ],
        ),
      ],
    );
  }
}
