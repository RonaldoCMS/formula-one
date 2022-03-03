import 'package:formulaone/model/classification_driver.dart';
import 'package:formulaone/model/classification_team.dart';
import 'package:formulaone/network/testing/test_drivers.dart';
import 'package:formulaone/network/testing/test_teams.dart';

class APIData {
  
  static Future<List<ClassificationDriver>> getDrivers() async {
    List<ClassificationDriver> result = [];

    for (int i = 0; i < test_driver.length; i++) {
      result.add(ClassificationDriver.fromJson(test_driver[i]));
    }
    await Future.delayed(Duration(seconds: 2));

    return result;
  }

  static Future<List<ClassificationTeam>> getTeams() async {
    List<ClassificationTeam> result = [];

    for (int i = 0; i < test_teams.length; i++) {
      result.add(ClassificationTeam.fromJson(test_teams[i]));
    }
    await Future.delayed(Duration(seconds: 2));
    return result;
  }
}
