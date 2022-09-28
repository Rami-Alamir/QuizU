import 'package:flutter/material.dart';
import '../../models/intro_list.dart';
import '../../utilities/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroFooter extends StatelessWidget {
  final int mSelectedPosition;

  final Function next;
  const IntroFooter(
      {Key? key, required this.mSelectedPosition, required this.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: mSelectedPosition == 0,
              child: TextButton(
                onPressed: () {
                  changeIntroStatus();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      "/Login", (Route<dynamic> route) => false);
                },
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                changeIntroStatus();
                mSelectedPosition + 1 == IntroList.introData.length
                    ? Navigator.of(context).pushNamedAndRemoveUntil(
                        "/Login", (Route<dynamic> route) => false)
                    : next();
              },
            )
          ],
        ),
      ),
    );
  }

  // used to save intro status
  void changeIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro', false);
  }
}
