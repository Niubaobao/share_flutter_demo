import 'package:first_demo/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'global_config.dart';

/// app 入口
///
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ClobalConfig.themeData,
      home: HomePage(),
    );
  }
}
