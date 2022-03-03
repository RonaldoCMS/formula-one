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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ElevatedButton(
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
          const Divider(),
          const Text("Season 2021", textAlign: TextAlign.center),
        ],
      ),
    ));
  }

  Widget driver(List<ClassificationTeam> teams) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.black.withOpacity(0.4),
          ),
          child: ListTile(
            leading: Text("${teams[index].position} °", style: textStyle()),
            trailing: Text("${teams[index].points} PT", style: textStyle()),
            title: Image.network(teams[index].team.logo),
          ),
        );
      },
      itemCount: teams.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent),
    );
  }

  TextStyle textStyle() => TextStyle(color: Colors.white);
}
