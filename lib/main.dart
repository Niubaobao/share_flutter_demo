import 'package:first_demo/pages/home/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'global_config.dart';

/// app 入口
///
void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  // SystemChrome.setPreferredOrientations(// 使设备横屏显示
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
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
