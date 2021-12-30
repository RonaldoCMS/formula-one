import 'package:flutter/cupertino.dart';
import 'package:formulaone/model/classification_driver.dart';
import 'package:formulaone/network/api_data.dart';
import 'package:formulaone/viewmodel/classification_teams_view_model.dart';

class ClassificationDriver_ViewModel extends ChangeNotifier {
  ClassificationDriver_ViewModel() {}

  List<ClassificationDriver>? drivers;

  Future<void> getDrivers() async {
    drivers = await APIData.getDrivers();
    notifyListeners();
  }
}
