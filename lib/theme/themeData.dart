// ignore_for_file: file_names

import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: 'formula',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.red.shade700,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        ),
      ),
    ),
  );
}
