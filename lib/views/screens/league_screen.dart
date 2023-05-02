import 'package:flutter/material.dart';
import 'package:nba_stats_app/views/widgets/wins_chart.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("League")
      ),
      body: ListView(
        children: const [
          WinsChart(),
          WinsChart(),
        ],
      )
    );
  }
}