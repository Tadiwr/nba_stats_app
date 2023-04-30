import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nba_stats_app/screens/league_screen.dart';
import 'package:nba_stats_app/screens/team_screen.dart';
import 'package:nba_stats_app/widgets/matches.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


class AppWraper extends StatefulWidget {
  const AppWraper({super.key});

  @override
  State<AppWraper> createState() => _AppWraperState();
}

class _AppWraperState extends State<AppWraper> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const LeagueScreen(),
      const TeamScreen(),
      const UpcomingMatches()
    ];
  }

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LeagueScreen(),
      )
    );
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "League",
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shield),
        title: "Teams",
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        title: "Matches",
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreens(),
      items: navBarItems(),
    );
  }
}