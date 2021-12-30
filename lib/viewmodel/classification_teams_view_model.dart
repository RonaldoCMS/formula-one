import 'package:flutter/material.dart';
import 'package:formulaone/model/classification_team.dart';
import 'package:formulaone/network/api_data.dart';

class ClassificationTeams_ViewModel extends ChangeNotifier {
    ClassificationTeams_ViewModel() {}

  List<ClassificationTeam>? teams;

  Future<void> getDrivers() async {
    teams = await APIData.getTeams();
    notifyListeners();
  }
}