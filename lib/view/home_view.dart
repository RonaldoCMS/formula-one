import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulaone/view/classification_teams_view.dart';
import 'package:formulaone/view/classification_driver_view.dart';

class Home_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(flex: 21),
            Expanded(flex: 60, child: _header()),
            const Spacer(flex: 7),
            Expanded(flex: 10, child: _selectNavigator(context)),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Image.asset("assets/logo.png");
  }

  Widget _selectNavigator(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 45,
          child: _elevatedButton(
              () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClassificationTeams_View()),
                  ),
              "Teams"),
        ),
        Spacer(flex: 10),
        Expanded(
          flex: 45,
          child: _elevatedButton(
              () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClassificationDriver_View()),
                  ),
              "Drivers"),
        ),
      ],
    );
  }

  Widget _elevatedButton(Function onPressed, text) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: SizedBox.expand(
        child: FittedBox(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
