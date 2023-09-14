import 'dart:convert';
import 'package:flutter/services.dart';

class Utils {
  Utils._();
  static Future<dynamic> readJson(String location) async {
    final String response = await rootBundle.loadString(location);
    return json.decode(response);
  }
}
