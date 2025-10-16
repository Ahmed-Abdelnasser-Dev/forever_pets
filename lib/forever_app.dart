import 'package:flutter/material.dart';

class ForeverApp extends StatelessWidget {
  const ForeverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forever Pets',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: Text('Forever Pets'))),
    );
  }
}
