import 'package:flutter/material.dart';

import '../../widgets/shared/rounded_rectangle_button.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("X",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 30)))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0, bottom: 15),
                child: Image.asset(
                  "assets/images/sad.png",
                ),
              ),
            ],
          ),
          Text(
            "Wrong Answer",
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: RoundedRectangleButton(
                    title: 'TRY AGAIN',
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed("/Quiz")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
