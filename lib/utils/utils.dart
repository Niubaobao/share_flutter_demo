import 'package:flutter/services.dart';

class Utils {
  static Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}
