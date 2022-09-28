import 'package:flutter/material.dart';
import 'package:quizu/screens/leaderboard/leaderboard.dart';
import 'package:quizu/screens/quiz/start.dart';
import '../../utilities/q_icons.dart';
import '../../utilities/size_config.dart';
import '../../widgets/shared/bottom_nav_item.dart';
import '../profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0; // to keep track of active tab index

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final List<Widget> screens = [
      const Start(),
      const Leaderboard(),
      const Profile(),
    ];

    return Scaffold(
      body: screens.elementAt(currentTab),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          QIcons.trophy,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            currentTab = 1;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BottomNavItem(
                    icon: QIcons.home,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },
                    isSelected: currentTab == 0),
                // Right Tab bar icons
                BottomNavItem(
                    icon: QIcons.profile,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },
                    isSelected: currentTab == 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
