import 'package:flutter/material.dart';
import 'package:formulaone/model/classification_driver.dart';
import 'package:formulaone/viewmodel/classification_driver_view_model.dart';
import 'package:stacked/stacked.dart';

class ClassificationDriver_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ClassificationDriver_ViewModel>.reactive(
        viewModelBuilder: () => ClassificationDriver_ViewModel(),
        onModelReady: (model) => model.getDrivers(),
        builder: (context, viewModel, child) => _body(context, viewModel),
      ),
    );
  }

  Widget _body(BuildContext context, ClassificationDriver_ViewModel viewModel) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/logo.png"),
          Expanded(
            child: Builder(
              builder: (context) {
                if (viewModel.drivers == null) {
                  return Center(
                      child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.red.shade700),
                  ));
                }
                return Column(
                  children: [
                    Expanded(
                      child: driver(viewModel.drivers!),
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Back",
            ),
          ),
          const Divider(),
          const Text("Season 2021", textAlign: TextAlign.center),
        ],
      ),
    ));
  }

  Widget driver(List<ClassificationDriver> drivers) {
    return ListView.separated(
      itemBuilder: (context, index) {
        List<String> splitName = drivers[index].driver.name.split(" ");
        double? points = drivers[index].points;
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
            ),
            color: Colors.red,
          ),
          child: ListTile(
            subtitle: Text(
              drivers[index].team.name,
              style: TextStyle(fontSize: 12),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(splitName[0]),
                Text(splitName[1]),
              ],
            ),
            trailing: Text("$points PT"),
            leading: Text("${drivers[index].position}°"),
          ),
        );
      },
      itemCount: drivers.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent),
    );
  }
}
