import "package:flutter/material.dart";
import "package:nba_stats_app/data/apis/espn_core_api.dart";

import "../../styles/text_styles.dart";

class FavouriteTeam extends StatefulWidget {
  const FavouriteTeam({super.key, required this.teamId});

  final int teamId;

  @override
  State<FavouriteTeam> createState() => _FavouriteTeamState();
}

class _FavouriteTeamState extends State<FavouriteTeam> {

  // Get team Data

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TeamBanner(teamId: widget.teamId,)
      ],
    );
  }
}

class TeamBanner extends StatefulWidget {
  const TeamBanner({super.key, required this.teamId});
  final int teamId;

  @override
  State<TeamBanner> createState() => _TeamBannerState();
}

class _TeamBannerState extends State<TeamBanner> {

  String logoUrl = "";
  final api = EsonCoreApi();
  

  // Get team data
  

  @override
  void initState() {
    
    super.initState();

    if(widget.teamId == -1) {
      debugPrint("We have a problem");
    } 

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getSingleTeamData(widget.teamId),
      builder: (context, snapshot) {
        debugPrint(widget.teamId.toString());
        if(snapshot.hasData) {
          final String name = snapshot.data?.name ?? "";
          final String logoUrl = snapshot.data?.logoUrl ?? "";
          
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(logoUrl),
                  ),
                  Text(name, style: h1,)
                ],

              ),

              // TODO: Add section to view athletes

            ],
          );
        }
        else if(snapshot.hasError) {
          debugPrint(snapshot.error.toString());
          return const Center(child: Text("Something went wrong on our side 🤕"));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}