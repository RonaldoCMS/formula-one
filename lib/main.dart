import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulaone/model/classification_driver.dart';
import 'package:formulaone/network/api_data.dart';
import 'package:formulaone/theme/themeData.dart';
import 'package:formulaone/view/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red.shade700,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      home: Home_View(),
    );
  }
}
