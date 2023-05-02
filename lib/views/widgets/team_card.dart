import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.teamName, required this.teamAbrreviation});

  final String teamName;
  final String teamAbrreviation;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: const Color.fromARGB(255, 32, 32, 32),
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.teamName, style: const TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.activeGreen
                    ),),
                    Text(widget.teamAbrreviation, style: const TextStyle(
                      color: Colors.grey
                    ),)
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}