import "package:flutter/material.dart";
import "package:nba_stats_app/data/repo.dart";
import "package:intl/intl.dart";
import "package:nba_stats_app/styles/text_styles.dart";
import "../widgets/match_card.dart";

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});
  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();

}

class _UpcomingMatchesState extends State<UpcomingMatches> {

  final repo = Repo();
  String dateString = "";

  void loadDate() {
    DateTime now = DateTime.now();

    // Format the date in words.
    DateFormat dateFormat = DateFormat('EEEE d MMMM  yyyy');
    dateString = dateFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {

    loadDate();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Matches")
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(dateString, style: h2)
          ),
          Expanded(
            flex: 9,
            child: FutureBuilder(
              future: repo.getScoreBoard(),
              builder: (context, snapshot) {
          
                if (snapshot.hasData) {
                  int itemCount = snapshot.data?.events.length ?? 0;

                  if (itemCount == 0) {
                    debugPrint("No matches today");
                    return const Center(
                      child: Text("No matches today"),
                    );
                  } else {
                    debugPrint("$itemCount");
                    final event = snapshot.data?.events[0].shortName;
                    debugPrint("Match : $event");
                    return ListView.builder(
                    itemCount: snapshot.data?.events.length ?? 0,
                    itemBuilder:(context, index) {
                      final eventN = snapshot.data?.events[index];
                      return MatchCard(data: eventN);
                    },
                  );
                  }
                }
          
                else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );  
                }
              },
            ),
          ),
        ],
      )
    );
  }
}