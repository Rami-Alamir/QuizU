import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/models/user_score.dart';
import 'package:share_plus/share_plus.dart';
import '../../provider/quiz_provider.dart';
import '../../provider/user_provider.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late int score;
  @override
  void initState() {
    final QuizProvider quizProvider =
        Provider.of<QuizProvider>(context, listen: false);
    score = quizProvider.score;

    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider
        .addNewScore(UserScore(score: score, date: DateTime.now().toString()));
    quizProvider.postingUserScore();
    super.initState();
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 30),
                    child: Image.asset(
                      "assets/images/flag.png",
                    ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'You Have Completed',
                    style: Theme.of(context).textTheme.headline1,
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n $score",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 34),
                      ),
                      const TextSpan(
                        text: "\n correct answer",
                      )
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Share.share('I have answered $score correct question',
                    subject: 'QuizU score');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 10),
                    child: Icon(Icons.share,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "Share",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 28),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
