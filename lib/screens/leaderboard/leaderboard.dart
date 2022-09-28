import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/widgets/shared/retry.dart';
import 'package:quizu/widgets/shared/spinkit_indicator.dart';
import '../../provider/leaderboard_provider.dart';
import '../../widgets/leaderboard/leaderboard_card.dart';
import '../../widgets/leaderboard/leaderboard_header.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    final LeaderboardProvider leaderboardProvider =
        Provider.of<LeaderboardProvider>(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text('Leaderboard'),
      ),
      body: leaderboardProvider.isLoading
          ? const SpinkitIndicator()
          : leaderboardProvider.retry
              ? Retry(onPressed: () {
                  leaderboardProvider.setIsLoading = true;
                  leaderboardProvider.getTopScores();
                })
              : RefreshIndicator(
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onRefresh: () async {
                    await leaderboardProvider.getTopScores(isLoading: false);
                  },
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const LeaderboardHeader(),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: leaderboardProvider.topScoresList.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return LeaderboardCard(
                                topScores:
                                    leaderboardProvider.topScoresList[index],
                                index: index + 1);
                          })
                    ],
                  ),
                ),
    );
  }
}
