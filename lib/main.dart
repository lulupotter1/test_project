import 'package:flutter/material.dart';
import 'package:global_test_project/core/app/app.dart';
import 'package:global_test_project/core/app/app_injection.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}
