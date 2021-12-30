import 'package:flutter/cupertino.dart';
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/logo.png"),
          ),
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
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
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

  Widget driver(List<ClassificationDriver> drivers) {
    return ListView.separated(
      itemBuilder: (context, index) {
        List<String> splitName = drivers[index].driver.name.split(" ");
        return Container(
          //height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
            ),
            color: Colors.red,
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(splitName[0], textScaleFactor: 1),
                    Text(splitName[1]),
                    Text(drivers[index].team.name, textScaleFactor: 0.3),
                  ],
                ),
                Text(
                  "${drivers[index].points} PT",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
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
