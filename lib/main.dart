import 'dart:io';

import 'package:flutter/material.dart';
import 'package:machine_test/core/network/httpoverrides.dart';
import 'package:machine_test/views/home_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false
  ));
}
