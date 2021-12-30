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
            const Spacer(),
            _header(),
            const Spacer(),
            _selectNavigator(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: 150,
      height: 150,
      child: Image.asset("assets/logo.png"),
    );
  }

  Widget _selectNavigator(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _elevatedButton(
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassificationTeams_View()),
                ),
            "Teams"),
        Divider(),
        _elevatedButton(
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassificationDriver_View()),
                ),
            "Drivers"),
      ],
    );
  }

  Widget _elevatedButton(Function onPressed, text) {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          textScaleFactor: 1,
        ),
      ),
    );
  }
}
