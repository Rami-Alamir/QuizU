import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizu/provider/user_provider.dart';
import '../../utilities/show_dialog.dart';
import '../../widgets/profile/score_card.dart';
import '../../widgets/shared/retry.dart';
import '../../widgets/shared/spinkit_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12.0, bottom: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    ShowConfirmDialog().confirmDialog(context);
                  }))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: userProvider.isLoading
          ? const SpinkitIndicator()
          : userProvider.retry
              ? Retry(onPressed: () {
                  userProvider.setIsLoading = true;
                  userProvider.getUserData();
                })
              : ListView(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 20),
                  children: [
                    AvatarGlow(
                      glowColor: Theme.of(context).primaryColor,
                      endRadius: 65.0,
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                            ((userProvider.user?.name) ?? " ").substring(0, 1),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Colors.white,
                                    height: 3,
                                    fontSize: 24)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                      child: Text((userProvider.user?.name) ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontWeight: FontWeight.w500)),
                    ),
                    Text((userProvider.user?.mobile) ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4),
                    Visibility(
                      visible: userProvider.myScoresList.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, bottom: 5, left: 10),
                        child: Text("My Scores",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: userProvider.myScoresList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ScoreCard(
                              userScore: userProvider.myScoresList[index]);
                        }),
                  ],
                ),
    );
  }
}
