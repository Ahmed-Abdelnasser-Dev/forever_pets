import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:forever_pets/forever_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  bool isFirstTime = sharedPrefs.getBool('isFirstTime') ?? true;
  runApp(ForeverApp(isFirstTime: isFirstTime));
}
