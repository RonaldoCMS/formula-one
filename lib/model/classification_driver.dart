import 'dart:developer';

import 'package:formulaone/model/driver.dart';
import 'package:formulaone/model/team.dart';

class ClassificationDriver {
  late int position;
  late Driver driver;
  late Team team;
  double? points;
  int? wins;
  int? behind;
  late int season;

  ClassificationDriver(this.position, this.driver, this.team, this.points,
      this.wins, this.behind, this.season);

  ClassificationDriver.fromJson(Map<String, dynamic> json) {
    log("points -> ${json['points']} ");
    position = json['position'];
    driver = (json['driver'] != null ? Driver.fromJson(json['driver']) : null)!;
    team = (json['team'] != null ? Team.fromJson(json['team']) : null)!;
    points = (json['points'].runtimeType == int)
        ? json['points'].toDouble()
        : double.parse(json['points'] ?? "0");
    wins = json['wins'];
    behind = json['behind'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = position;
    data['driver'] = driver.toJson();
    data['team'] = team.toJson();
    data['points'] = points;
    data['wins'] = wins;
    data['behind'] = behind;
    data['season'] = season;
    return data;
  }

  String toString() {
    return "position $position, driver $driver, team $team  points $points, wins $wins";
  }
}
