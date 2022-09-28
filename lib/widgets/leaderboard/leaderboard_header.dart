import 'package:flutter/material.dart';
import '../../utilities/wave_clipper.dart';
import 'leaderboard_row.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: WaveClipper(),
        child: Container(
            height: 380,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ])),
            child: const LeaderboardRow()));
  }
}
