import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulaone/model/classification_driver.dart';
import 'package:formulaone/model/classification_team.dart';
import 'package:formulaone/viewmodel/classification_driver_view_model.dart';
import 'package:formulaone/viewmodel/classification_teams_view_model.dart';
import 'package:stacked/stacked.dart';

class ClassificationTeams_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ClassificationTeams_ViewModel>.reactive(
        viewModelBuilder: () => ClassificationTeams_ViewModel(),
        onModelReady: (model) => model.getDrivers(),
        builder: (context, viewModel, child) => _body(context, viewModel),
      ),
    );
  }

  Widget _body(BuildContext context, ClassificationTeams_ViewModel viewModel) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(color: Colors.red.shade700),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset(
              "assets/logo.png",
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 10,
            child: Builder(
              builder: (context) {
                if (viewModel.teams == null) {
                  return Center(
                      child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red.shade700,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ));
                }
                return Column(
                  children: [
                    Expanded(
                      child: driver(viewModel.teams!),
                    ),
                  ],
                );
              },
            ),
          ),
          Spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.red,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Back",
                textScaleFactor: 1,
              ),
            ),
          ),
          const Divider(),
          const Text("Season 2021"),
        ],
      ),
    ));
  }

  Widget driver(List<ClassificationTeam> teams) {
    return ListView.separated(
      itemBuilder: (context, index) {
        //List<String> splitName = drivers[index].driver.name.split(" ");
        return Container(
          //height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${teams[index].team.logo}"),
            ),
            color: Colors.red,
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Text(
                    "${teams[index].points} PT",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Text(
                "${teams[index].position}°",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: teams.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent),
    );
  }
}
