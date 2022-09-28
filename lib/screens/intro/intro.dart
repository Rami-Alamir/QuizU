import 'package:flutter/material.dart';
import '../../models/intro_list.dart';
import '../../widgets/intro/dots_indicator.dart';
import '../../widgets/intro/intro_card.dart';
import '../../widgets/intro/intro_footer.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<Intro> {
  int mSelectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: SizedBox(
            height: 400,
            child: PageView.builder(
              controller: PageController(
                  initialPage: mSelectedPosition,
                  keepPage: true,
                  viewportFraction: 1),
              itemCount: IntroList.introData.length,
              onPageChanged: (index) {
                setState(() {
                  mSelectedPosition = index;
                });
              },
              itemBuilder: (context, i) {
                return IntroCard(mSelectedPosition: mSelectedPosition);
              },
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: DotsIndicator(
                index: mSelectedPosition,
                count: IntroList.introData.length,
                accentColor: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
            IntroFooter(
                mSelectedPosition: mSelectedPosition,
                next: () {
                  setState(() {
                    mSelectedPosition = mSelectedPosition + 1;
                  });
                }),
          ],
        )
      ],
    ));
  }
}
