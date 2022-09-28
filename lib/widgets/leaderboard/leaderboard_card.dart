import 'package:flutter/material.dart';

import '../../models/top_scores.dart';
import '../../utilities/size_config.dart';

class LeaderboardCard extends StatelessWidget {
  final TopScores topScores;
  final int index;
  const LeaderboardCard({
    Key? key,
    required this.topScores,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 0, right: 10, left: 10),
      child: Transform.translate(
        offset: const Offset(0, -60),
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          elevation: 10,
          shadowColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.14),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.5))),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6.5)),
              child: Container(
                  constraints: const BoxConstraints(minHeight: 85),
                  width: SizeConfig.screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 15, 0),
                              child: CircleAvatar(
                                backgroundImage: const AssetImage(
                                  "assets/images/user.png",
                                ),
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                radius: 25,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${topScores.name}",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                  "${topScores.score} Points",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(height: 1.4),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "#$index",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
