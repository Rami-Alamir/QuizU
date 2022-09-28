import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/leaderboard_provider.dart';
import 'leaderboard_circle.dart';

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeaderboardProvider leaderboardProvider =
        Provider.of<LeaderboardProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LeaderboardCircle(
            name: leaderboardProvider.topScoresList[1].name ?? "",
            scaleFactor: 1,
            child: Text(
              "2",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white),
            ),
          ),
          LeaderboardCircle(
            name: leaderboardProvider.topScoresList[0].name ?? "",
            scaleFactor: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 15),
              child: Image.asset(
                "assets/images/trophy.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          LeaderboardCircle(
            name: leaderboardProvider.topScoresList[2].name ?? "",
            scaleFactor: 1,
            child: Text(
              "3",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
