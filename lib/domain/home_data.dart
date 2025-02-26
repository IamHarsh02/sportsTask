class HomeData {
  Matchdetail? matchdetail;
  List<String>? nuggets;
  List<Innings>? innings;

  Teams? teams;
  Notes? notes;

  HomeData({this.matchdetail, this.nuggets, this.innings, this.teams});

  HomeData.fromJson(Map<String, dynamic> json) {
    matchdetail = json['Matchdetail'] != null
        ? new Matchdetail.fromJson(json['Matchdetail'])
        : null;
    nuggets = json['Nuggets'].cast<String>();
    if (json['Innings'] != null) {
      innings = <Innings>[];
      json['Innings'].forEach((v) {
        innings!.add(new Innings.fromJson(v));
      });
    }
    teams = json['Teams'] != null ? new Teams.fromJson(json['Teams']) : null;
    notes = json['Notes'] != null ? new Notes.fromJson(json['Notes']) : null;
  }
}

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.matchdetail != null) {
//       data['Matchdetail'] = this.matchdetail!.toJson();
//     }
//     data['Nuggets'] = this.nuggets;
//     if (this.innings != null) {
//       data['Innings'] = this.innings!.map((v) => v.toJson()).toList();
//     }
//   //   if (this.teams != null) {
//   //   //       data['Teams'] = this.teams!.toJson();
//   //   //     }
//   //   //     if (this.notes != null) {
//   //   //       data['Notes'] = this.notes!.toJson();
//   //   //     }
//   //   return data;
//   // }
// }

class Matchdetail {
  String? teamHome;
  String? teamAway;
  Match? match;
  Series? series;
  Venue? venue;
  Officials? officials;
  String? weather;
  String? tosswonby;
  String? status;
  String? statusId;
  String? playerMatch;
  String? result;
  String? winningteam;
  String? winmargin;
  String? equation;

  Matchdetail(
      {this.teamHome,
      this.teamAway,
      this.match,
      this.series,
      this.venue,
      this.officials,
      this.weather,
      this.tosswonby,
      this.status,
      this.statusId,
      this.playerMatch,
      this.result,
      this.winningteam,
      this.winmargin,
      this.equation});

  Matchdetail.fromJson(Map<String, dynamic> json) {
    teamHome = json['Team_Home'];
    teamAway = json['Team_Away'];
    match = json['Match'] != null ? new Match.fromJson(json['Match']) : null;
    series =
        json['Series'] != null ? new Series.fromJson(json['Series']) : null;
    venue = json['Venue'] != null ? new Venue.fromJson(json['Venue']) : null;
    officials = json['Officials'] != null
        ? new Officials.fromJson(json['Officials'])
        : null;
    weather = json['Weather'];
    tosswonby = json['Tosswonby'];
    status = json['Status'];
    statusId = json['Status_Id'];
    playerMatch = json['Player_Match'];
    result = json['Result'];
    winningteam = json['Winningteam'];
    winmargin = json['Winmargin'];
    equation = json['Equation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Team_Home'] = this.teamHome;
    data['Team_Away'] = this.teamAway;
    if (this.match != null) {
      data['Match'] = this.match!.toJson();
    }
    if (this.series != null) {
      data['Series'] = this.series!.toJson();
    }
    if (this.venue != null) {
      data['Venue'] = this.venue!.toJson();
    }
    if (this.officials != null) {
      data['Officials'] = this.officials!.toJson();
    }
    data['Weather'] = this.weather;
    data['Tosswonby'] = this.tosswonby;
    data['Status'] = this.status;
    data['Status_Id'] = this.statusId;
    data['Player_Match'] = this.playerMatch;
    data['Result'] = this.result;
    data['Winningteam'] = this.winningteam;
    data['Winmargin'] = this.winmargin;
    data['Equation'] = this.equation;
    return data;
  }
}

class Match {
  String? livecoverage;
  String? id;
  String? code;
  String? league;
  String? number;
  String? type;
  String? date;
  String? time;
  String? offset;
  String? daynight;

  Match(
      {this.livecoverage,
      this.id,
      this.code,
      this.league,
      this.number,
      this.type,
      this.date,
      this.time,
      this.offset,
      this.daynight});

  Match.fromJson(Map<String, dynamic> json) {
    livecoverage = json['Livecoverage'];
    id = json['Id'];
    code = json['Code'];
    league = json['League'];
    number = json['Number'];
    type = json['Type'];
    date = json['Date'];
    time = json['Time'];
    offset = json['Offset'];
    daynight = json['Daynight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Livecoverage'] = this.livecoverage;
    data['Id'] = this.id;
    data['Code'] = this.code;
    data['League'] = this.league;
    data['Number'] = this.number;
    data['Type'] = this.type;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['Offset'] = this.offset;
    data['Daynight'] = this.daynight;
    return data;
  }
}

class Series {
  String? id;
  String? name;
  String? status;
  String? tour;
  String? tourName;

  Series({this.id, this.name, this.status, this.tour, this.tourName});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    status = json['Status'];
    tour = json['Tour'];
    tourName = json['Tour_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Status'] = this.status;
    data['Tour'] = this.tour;
    data['Tour_Name'] = this.tourName;
    return data;
  }
}

class Venue {
  String? id;
  String? name;

  Venue({this.id, this.name});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class Officials {
  String? umpires;
  String? referee;

  Officials({this.umpires, this.referee});

  Officials.fromJson(Map<String, dynamic> json) {
    umpires = json['Umpires'];
    referee = json['Referee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Umpires'] = this.umpires;
    data['Referee'] = this.referee;
    return data;
  }
}

class Innings {
  String? number;
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;
  String? runrate;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? allottedOvers;
  List<Batsmen>? batsmen;
  PartnershipCurrent? partnershipCurrent;
  List<Bowlers>? bowlers;
  List<FallofWickets>? fallofWickets;
  PowerPlay? powerPlay;
  String? target;

  Innings(
      {this.number,
      this.battingteam,
      this.total,
      this.wickets,
      this.overs,
      this.runrate,
      this.byes,
      this.legbyes,
      this.wides,
      this.noballs,
      this.penalty,
      this.allottedOvers,
      this.batsmen,
      this.partnershipCurrent,
      this.bowlers,
      this.fallofWickets,
      this.powerPlay,
      this.target});

  Innings.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    battingteam = json['Battingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    runrate = json['Runrate'];
    byes = json['Byes'];
    legbyes = json['Legbyes'];
    wides = json['Wides'];
    noballs = json['Noballs'];
    penalty = json['Penalty'];
    allottedOvers = json['AllottedOvers'];
    if (json['Batsmen'] != null) {
      batsmen = <Batsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(new Batsmen.fromJson(v));
      });
    }
    partnershipCurrent = json['Partnership_Current'] != null
        ? new PartnershipCurrent.fromJson(json['Partnership_Current'])
        : null;
    if (json['Bowlers'] != null) {
      bowlers = <Bowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(new Bowlers.fromJson(v));
      });
    }
    if (json['FallofWickets'] != null) {
      fallofWickets = <FallofWickets>[];
      json['FallofWickets'].forEach((v) {
        fallofWickets!.add(new FallofWickets.fromJson(v));
      });
    }
    powerPlay = json['PowerPlay'] != null
        ? new PowerPlay.fromJson(json['PowerPlay'])
        : null;
    target = json['Target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Number'] = this.number;
    data['Battingteam'] = this.battingteam;
    data['Total'] = this.total;
    data['Wickets'] = this.wickets;
    data['Overs'] = this.overs;
    data['Runrate'] = this.runrate;
    data['Byes'] = this.byes;
    data['Legbyes'] = this.legbyes;
    data['Wides'] = this.wides;
    data['Noballs'] = this.noballs;
    data['Penalty'] = this.penalty;
    data['AllottedOvers'] = this.allottedOvers;
    if (this.batsmen != null) {
      data['Batsmen'] = this.batsmen!.map((v) => v.toJson()).toList();
    }
    if (this.partnershipCurrent != null) {
      data['Partnership_Current'] = this.partnershipCurrent!.toJson();
    }
    if (this.bowlers != null) {
      data['Bowlers'] = this.bowlers!.map((v) => v.toJson()).toList();
    }
    if (this.fallofWickets != null) {
      data['FallofWickets'] =
          this.fallofWickets!.map((v) => v.toJson()).toList();
    }
    if (this.powerPlay != null) {
      data['PowerPlay'] = this.powerPlay!.toJson();
    }
    data['Target'] = this.target;
    return data;
  }
}

class Batsmen {
  String? batsman;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? dots;
  String? strikerate;
  String? dismissal;
  String? howout;
  String? bowler;
  String? fielder;
  bool? isonstrike;

  Batsmen(
      {this.batsman,
      this.runs,
      this.balls,
      this.fours,
      this.sixes,
      this.dots,
      this.strikerate,
      this.dismissal,
      this.howout,
      this.bowler,
      this.fielder,
      this.isonstrike});

  Batsmen.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    dots = json['Dots'];
    strikerate = json['Strikerate'];
    dismissal = json['Dismissal'];
    howout = json['Howout'];
    bowler = json['Bowler'];
    fielder = json['Fielder'];
    isonstrike = json['Isonstrike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Batsman'] = this.batsman;
    data['Runs'] = this.runs;
    data['Balls'] = this.balls;
    data['Fours'] = this.fours;
    data['Sixes'] = this.sixes;
    data['Dots'] = this.dots;
    data['Strikerate'] = this.strikerate;
    data['Dismissal'] = this.dismissal;
    data['Howout'] = this.howout;
    data['Bowler'] = this.bowler;
    data['Fielder'] = this.fielder;
    data['Isonstrike'] = this.isonstrike;
    return data;
  }
}

class PartnershipCurrent {
  String? runs;
  String? balls;
  List<Batsmen>? batsmen;

  PartnershipCurrent({this.runs, this.balls, this.batsmen});

  PartnershipCurrent.fromJson(Map<String, dynamic> json) {
    runs = json['Runs'];
    balls = json['Balls'];
    if (json['Batsmen'] != null) {
      batsmen = <Batsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(new Batsmen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Runs'] = this.runs;
    data['Balls'] = this.balls;
    if (this.batsmen != null) {
      data['Batsmen'] = this.batsmen!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Batsmens {
  String? batsman;
  String? runs;
  String? balls;

  Batsmens({this.batsman, this.runs, this.balls});

  Batsmens.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Batsman'] = this.batsman;
    data['Runs'] = this.runs;
    data['Balls'] = this.balls;
    return data;
  }
}

class Bowlers {
  String? bowler;
  String? overs;
  String? maidens;
  String? runs;
  String? wickets;
  String? economyrate;
  String? noballs;
  String? wides;
  String? dots;
  bool? isbowlingtandem;
  bool? isbowlingnow;
  List<ThisOver>? thisOver;

  Bowlers(
      {this.bowler,
      this.overs,
      this.maidens,
      this.runs,
      this.wickets,
      this.economyrate,
      this.noballs,
      this.wides,
      this.dots,
      this.isbowlingtandem,
      this.isbowlingnow,
      this.thisOver});

  Bowlers.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    maidens = json['Maidens'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    economyrate = json['Economyrate'];
    noballs = json['Noballs'];
    wides = json['Wides'];
    dots = json['Dots'];
    isbowlingtandem = json['Isbowlingtandem'];
    isbowlingnow = json['Isbowlingnow'];
    if (json['ThisOver'] != null) {
      thisOver = <ThisOver>[];
      json['ThisOver'].forEach((v) {
        thisOver!.add(new ThisOver.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bowler'] = this.bowler;
    data['Overs'] = this.overs;
    data['Maidens'] = this.maidens;
    data['Runs'] = this.runs;
    data['Wickets'] = this.wickets;
    data['Economyrate'] = this.economyrate;
    data['Noballs'] = this.noballs;
    data['Wides'] = this.wides;
    data['Dots'] = this.dots;
    data['Isbowlingtandem'] = this.isbowlingtandem;
    data['Isbowlingnow'] = this.isbowlingnow;
    if (this.thisOver != null) {
      data['ThisOver'] = this.thisOver!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThisOver {
  String? t;
  String? b;

  ThisOver({this.t, this.b});

  ThisOver.fromJson(Map<String, dynamic> json) {
    t = json['T'];
    b = json['B'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['T'] = this.t;
    data['B'] = this.b;
    return data;
  }
}

class FallofWickets {
  String? batsman;
  String? score;
  String? overs;

  FallofWickets({this.batsman, this.score, this.overs});

  FallofWickets.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    score = json['Score'];
    overs = json['Overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Batsman'] = this.batsman;
    data['Score'] = this.score;
    data['Overs'] = this.overs;
    return data;
  }
}

class PowerPlay {
  String? pP1;
  String? pP2;

  PowerPlay({this.pP1, this.pP2});

  PowerPlay.fromJson(Map<String, dynamic> json) {
    pP1 = json['PP1'];
    pP2 = json['PP2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PP1'] = this.pP1;
    data['PP2'] = this.pP2;
    return data;
  }
}

class Batting {
  String? style;
  String? average;
  String? strikerate;
  String? runs;

  Batting({this.style, this.average, this.strikerate, this.runs});

  Batting.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    strikerate = json['Strikerate'];
    runs = json['Runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Style'] = this.style;
    data['Average'] = this.average;
    data['Strikerate'] = this.strikerate;
    data['Runs'] = this.runs;
    return data;
  }
}

class Bowling {
  String? style;
  String? average;
  String? economyrate;
  String? wickets;

  Bowling({this.style, this.average, this.economyrate, this.wickets});

  Bowling.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    economyrate = json['Economyrate'];
    wickets = json['Wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Style'] = this.style;
    data['Average'] = this.average;
    data['Economyrate'] = this.economyrate;
    data['Wickets'] = this.wickets;
    return data;
  }
}

class Teams {
  TeamA? teamA;
  TeamB? teamB;

  Teams({this.teamA, this.teamB});

  Teams.fromJson(Map<String, dynamic> json) {
    teamA = json['4'] != null ? new TeamA.fromJson(json['4']) : null;
    teamB = json['5'] != null ? new TeamB.fromJson(json['5']) : null;
  }

  // Map<String, dynamic> toJson() {
  // final Map<String, dynamic> data = new Map<String, dynamic>();
  // if (this.44 != null) {
  // data['4'] = this.44!.toJson();
  // }
  // if (this.55 != null) {
  // data['5'] = this.55!.toJson();
  // }
  // return data;
  // }
}

class TeamA {
  String? nameFull;
  String? nameShort;
  Map<String, Players>? players;
  // Players? players;

  TeamA({this.nameFull, this.nameShort, this.players});

  factory TeamA.fromJson(Map<String, dynamic> json) {
    return TeamA(
      nameFull: json["Name_Full"] ?? "",
      nameShort: json["Name_Short"] ?? "",
      players: json["Players"] != null
          ? (json["Players"] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, Players.fromJson(value)),
            )
          : null,
    );
  }
}
// TeamA.fromJson(Map<String, dynamic> json) {
//   nameFull = json['Name_Full'];
//   nameShort = json['Name_Short'];
//   players =
//       json['Players'] != null ? new Players.fromJson(json['Players']) : null;
// }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['Name_Full'] = this.nameFull;
//   data['Name_Short'] = this.nameShort;
//   return data;
// }
// }

// class Players {
//   dynamic playerData;
//
//   Players({this.playerData});
//
//   Players.fromJson(Map<dynamic, dynamic> json) {
//     playerData = json['3632'] != null
//         ? new SelectedPlayerDetails.fromJson(json['3632'])
//         : null;
//     playerData = json['3722'] != null
//         ? new SelectedPlayerDetails.fromJson(json['3722'])
//         : null;
//     playerData = json['3852'] != null
//         ? new SelectedPlayerDetails.fromJson(json['3852'])
//         : null;
//     playerData = json['4176'] != null
//         ? new SelectedPlayerDetails.fromJson(json['4176'])
//         : null;
//     playerData = json['4532'] != null
//         ? new SelectedPlayerDetails.fromJson(json['4532'])
//         : null;
//     playerData = json['5132'] != null
//         ? new SelectedPlayerDetails.fromJson(json['5132'])
//         : null;
//     playerData = json['9844'] != null
//         ? new SelectedPlayerDetails.fromJson(json['9844'])
//         : null;
//     playerData = json['63187'] != null
//         ? new SelectedPlayerDetails.fromJson(json['63187'])
//         : null;
//     playerData = json['63751'] != null
//         ? new SelectedPlayerDetails.fromJson(json['63751'])
//         : null;
//     playerData = json['65867'] != null
//         ? new SelectedPlayerDetails.fromJson(json['65867'])
//         : null;
//     playerData = json['66818'] != null
//         ? new SelectedPlayerDetails.fromJson(json['66818'])
//         : null;
//   }
// }

class Players {
  String? position;
  String? nameFull;
  bool? iskeeper;
  Batting? batting;
  Bowling? bowling;

  Players(
      {this.position,
      this.nameFull,
      this.iskeeper,
      this.batting,
      this.bowling});

  Players.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    nameFull = json['Name_Full'];
    iskeeper = json['Iskeeper'];
    batting =
        json['Batting'] != null ? new Batting.fromJson(json['Batting']) : null;
    bowling =
        json['Bowling'] != null ? new Bowling.fromJson(json['Bowling']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Position'] = this.position;
    data['Name_Full'] = this.nameFull;
    data['Iskeeper'] = this.iskeeper;
    if (this.batting != null) {
      data['Batting'] = this.batting!.toJson();
    }
    if (this.bowling != null) {
      data['Bowling'] = this.bowling!.toJson();
    }
    return data;
  }
}

class TeamB {
  String? nameFull;
  String? nameShort;

  Map<String, Players>? players;
  // Players? players;

  TeamB({this.nameFull, this.nameShort, this.players});

  factory TeamB.fromJson(Map<String, dynamic> json) {
    return TeamB(
      nameFull: json["Name_Full"] ?? "",
      nameShort: json["Name_Short"] ?? "",
      players: json["Players"] != null
          ? (json["Players"] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, Players.fromJson(value)),
            )
          : null,
    );
  }
}

class Notes {
  List<String>? l1;
  List<String>? l2;

  Notes({this.l1, this.l2});

  Notes.fromJson(Map<String, dynamic> json) {
    l1 = json['1'].cast<String>();
    l2 = json['2'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.l1;
    data['2'] = this.l2;
    return data;
  }
}
