import 'dart:developer';


class ScoreBoardModel {
  final int type;
  final List<EventModel> events;
  final String data;

  ScoreBoardModel({
    required this.type,
    required this.events,
    required this.data,
  });

  factory ScoreBoardModel.fromJson(dynamic json) {

    final events = <EventModel>[];
    // extract events
    if (json["events"].isNotEmpty) {
      for(int x = 0; x < json["events"].length; x++) {
        EventModel eventX = EventModel.fromJson(json["events"][x]);
        events.add(eventX); 
      }
    }

    return ScoreBoardModel(
      type : json["season"]["year"],
      data: json["day"]["date"],
      events: events,
    );
  }

}

class EventModel {
  final int id;
  final String date;
  final String shortName;
  final int type;
  final Notes notes; 
  final Status status;
  final List<Competitor> competitors;
  // final HeadLine headline;
  // final String thumbnail;

  EventModel({
    required this.id,
    required this.date,
    required this.shortName,
    required this.type,
    required this.notes,
    required this.status,
    required this.competitors,
    // required this.headline, 
    // required this.thumbnail
  });


  factory EventModel.fromJson(dynamic json) {

    final List<Competitor> comps = [];
    final dynamic jsonComps = json["competitions"][0]["competitors"];

    for(int x = 0; x < jsonComps.length; x ++) {
      final competitorX = jsonComps[x];
      comps.add(Competitor.fromJson(competitorX));
    } 

    return EventModel(
      id: int.parse(json["id"]),
      date: json["date"],
      shortName: json["shortName"],
      type: json["season"]["type"],
      notes: Notes.fromJson(json["competitions"][0]["notes"]),
      status: Status.fromJson(json["status"]),
      // headline: HeadLine.fromJson(jsonEncode(json["competitions"][0])),
      competitors: comps,
      // thumbnail: json["competitions"][0]["headlines"][0]["video"][0]["thumbnail"]
    );
  }
}

class HeadLine {
  final String full;
  final String short;

  HeadLine({required this.full,required this.short});

  factory HeadLine.fromJson(dynamic json) {
    log(json);
    return HeadLine(
      full : json["description"],
      short: json["shortLinkText"]
    );
  }
}

class Status {
  final bool completed; 
  final String description;
  final int clock;
  final int period;
  final String displayClock;

  Status({
    required this.completed,
    required this.description,
    required this.clock,
    required this.period,
    required this.displayClock
  });

  factory Status.fromJson(dynamic json) {
    return Status(
      clock : json["clock"].toInt(),
      displayClock: json["displayClock"],
      description: json["type"]["description"],
      completed: json["type"]["completed"],
      period: json["period"]
    );
  }
}

class Competitor {
  final int id;
  final String displayName;
  final String homeAway;
  // final bool winner;
  final String score;
  final String logoUrl;
  final String color;
  final List<Leader> leaders;
  final Statistics statistics;

  Competitor({
    required this.id,
    required this.displayName,
    required this.homeAway,
    // required this.winner,
    required this.score,
    required this.logoUrl,
    required this.color,
    required this.leaders,
    required this.statistics,
  });

  factory Competitor.fromJson(dynamic json) {

    final jsonLeaders = json["leaders"];
    final List<Leader> leaders = [];

    for(int x = 0; x < jsonLeaders.length; x++) {
      final leaderX = jsonLeaders[x];
      leaders.add(Leader.fromJson(leaderX));
    }

    return Competitor(
      id: int.parse(json["id"]),
      displayName: json["team"]["displayName"],
      homeAway: json["homeAway"],
      score: json["score"],
      // winner: json["winner"],
      logoUrl: json["team"]["logo"],
      color: json["team"]["color"],
      leaders: leaders,
      statistics: Statistics.fromJson(json["statistics"]),
    );
  }
}

class Leader {
  final String category;
  final double value;
  final int athleteId;
  final String fullName;
  final String headshotUrl;
  final int jersey;

  Leader({
  required this.category,
  required this.value,
  required this.athleteId,
  required this.fullName,
  required this.headshotUrl,
  required this.jersey
  });

  factory Leader.fromJson(dynamic json) {
    return Leader(
      category: json["displayName"],
      athleteId: int.parse(json["leaders"][0]["athlete"]["id"]),
      fullName: json["leaders"][0]["athlete"]["fullName"],
      headshotUrl: json["leaders"][0]["athlete"]["headshot"],
      jersey: int.parse(json["leaders"][0]["athlete"]["jersey"]),
      value: json["leaders"][0]["value"]
    );
  }
}

class Statistics {

  final int rebounds;
  final int fieldGoalsAttempted;
  final int fieldGoalsMade;
  final String fgPercentage;
  final String freeThrowPct;
  final int points;
  final String threePointPct;
  final int threesMade;
  final int threesAttempted;

  Statistics({
    required this.rebounds,
    required this.fieldGoalsAttempted,
    required this.fieldGoalsMade,
    required this.fgPercentage,
    required this.freeThrowPct,
    required this.points,
    required this.threePointPct,
    required this.threesMade,
    required this.threesAttempted
  });

  factory Statistics.fromJson(dynamic json) {
    return Statistics(
      rebounds: int.parse(json[0]["displayValue"]),
      fieldGoalsAttempted: int.parse(json[3]["displayValue"]),
      fieldGoalsMade: int.parse(json[4]["displayValue"]),
      fgPercentage: json[5]["displayValue"],
      freeThrowPct: json[6]["displayValue"],
      points: int.parse(json[9]["displayValue"]),
      threePointPct: json[10]["displayValue"],
      threesMade: int.parse(json[12]["displayValue"]),
      threesAttempted: int.parse(json[11]["displayValue"])
    );
  }

}

class Notes {
  final String type;
  final String headline;

  Notes({required this.type, required this.headline});

  factory Notes.fromJson(dynamic json) {
    return Notes(
      type : json[0]["type"],
      headline: json[0]["headline"]
    );
  }
}

