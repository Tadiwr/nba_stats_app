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
        EventModel eventX = EventModel.fromJson(x);
        events.add(eventX); 
      }
    }

    return ScoreBoardModel(
      type : json["season"],
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
  final HeadLine headline;
  final String thumbnail;

  EventModel({
    required this.id,
    required this.date,
    required this.shortName,
    required this.type,
    required this.notes,
    required this.status,
    required this.competitors,
    required this.headline, 
    required this.thumbnail
  });


  factory EventModel.fromJson(dynamic json) {

    final List<Competitor> comps = [];
    final dynamic jsonComps = json["competitons"]["co mpetitors"];

    for(int x = 0; x < jsonComps.length; x ++) {
      final competitorX = jsonComps[x];
      comps.add(Competitor.fromJson(competitorX));
    } 

    return EventModel(
      id: json["id"],
      date: json["date"],
      shortName: json["ShortName"],
      type: json["season"]["type"],
      notes: Notes.fromJson(json["competitions"][""][0]["notes"]),
      status: Status.fromJson(json["status"]),
      headline: HeadLine.fromJson(json["competitions"][""][0]["headlines"]),
      competitors: comps,
      thumbnail: json["competitions"][0]["headlines"][0]["video"][0]["thumbnail"]
    );
  }
}

class HeadLine {
  final String full;
  final String short;

  HeadLine({required this.full,required this.short});

  factory HeadLine.fromJson(dynamic json) {
    return HeadLine(
      full : json["headlines"][0]["description"],
      short: json["headlines"][0]["shortLinkText"]
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
      clock : json["clock"],
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
  final bool winner;
  final int score;
  final String logoUrl;
  final String color;
  final List<Leader> leaders;
  final Statistics statistics;

  Competitor({
    required this.id,
    required this.displayName,
    required this.homeAway,
    required this.winner,
    required this.score,
    required this.logoUrl,
    required this.color,
    required this.leaders,
    required this.statistics,
  });

  factory Competitor.fromJson(dynamic json) {

    final jsonLeaders = json["leaders"];
    final List<Leader> _leaders = [];

    for(int x = 0; x < jsonLeaders.length; x++) {
      final leaderX = jsonLeaders[x];
      _leaders.add(Leader.fromJson(leaderX));
    }

    return Competitor(
      id: json["id"],
      displayName: json["team"]["displayName"],
      homeAway: json["homeAway"],
      winner: json["winner"],
      score: int.parse(json["score"]),
      logoUrl: json["logo"],
      color: json["color"],
      leaders: _leaders,
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
      athleteId: json["leaders"][0]["id"],
      fullName: json["leaders"][0]["fullName"],
      headshotUrl: json["leaders"][0]["headshot"],
      jersey: json["leaders"][0]["jersey"],
      value: json["value"]
    );
  }
}

class Statistics {

  final int rebounds;
  final int fieldGoalsAttempted;
  final int fieldGoalsMade;
  final double fgPercentage;
  final double freeThrowPct;
  final int points;
  final double threePointPct;
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
      fgPercentage: int.parse(json[5]["displayValue"]).toDouble(),
      freeThrowPct: int.parse(json[6]["displayValue"]).toDouble(),
      points: int.parse(json[9]["displayValue"]),
      threePointPct: int.parse(json[10]["displayValue"]).toDouble(),
      threesMade: int.parse(json[16]["displayValue"]),
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
      type : json["type"],
      headline: json["headline"]
    );
  }
}

