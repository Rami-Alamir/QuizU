import 'package:flutter/material.dart';
import '../../widgets/shared/logo.dart';
import '../../widgets/shared/rounded_rectangle_button.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Logo()),
            Text(
              'Welcome to our',
              style: Theme.of(context).textTheme.headline1!,
            ),
            Text(
              'QUIZ',
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 30),
            ),
            Text(
              'Ready to test your knowledge and challenge others?',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: RoundedRectangleButton(
                      title: 'START QUIZ',
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/Quiz")),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Answer as much questions correctly within 2 minutes',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
