import 'package:flutter/material.dart';
import 'package:quizu/models/user_score.dart';

class ScoreCard extends StatelessWidget {
  final UserScore userScore;
  const ScoreCard({Key? key, required this.userScore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 10,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.14),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.5))),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6.5)),
            child: Container(
                constraints: const BoxConstraints(minHeight: 85),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/trophy.png",
                            width: 50,
                            height: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "${userScore.date}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: 16),
                              ),
                              // Text(
                              //   "${userScore.time}",
                              //   style: Theme.of(context).textTheme.headline4,
                              // ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${userScore.score}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text("Points",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
