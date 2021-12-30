import 'package:formulaone/model/team.dart';

class ClassificationTeam {
  late int position;
  late Team team;
  late int points;
  late int season;

  ClassificationTeam(this.position, this.team, this.points, this.season);

  ClassificationTeam.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    team = (json['team'] != null ? Team.fromJson(json['team']) : null)!;
    points = json['points'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
    data['points'] = this.points;
    data['season'] = this.season;
    return data;
  }
}