import 'package:flutter/material.dart';
import 'package:insurance/application.dart';
import 'di.dart';

void main() async {
  await appDi.initDependencies();
  runApp(const Application());
}
