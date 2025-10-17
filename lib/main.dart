import 'package:flutter/material.dart';
import 'package:forever_pets/forever_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  bool isFirstTime = sharedPrefs.getBool('isFirstTime') ?? true;
  runApp(ForeverApp(isFirstTime: isFirstTime));
}
