import "package:flutter/material.dart";

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matches")
      ),
    );
  }
}