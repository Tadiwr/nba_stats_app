import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/themes/colors.dart';
import 'package:nba_stats_app/views/screens/home_screen.dart';
import 'package:nba_stats_app/views/screens/matches.dart';
import 'package:nba_stats_app/views/screens/team_screen.dart';
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
      const HomeScreen(),
      const TeamScreen(),
      const UpcomingMatches()
    ];
  }

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
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
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );

    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreens(),
      items: navBarItems(),
      backgroundColor: appColors.surfaceGrey,
      navBarStyle: NavBarStyle.style8
    );
  }
}