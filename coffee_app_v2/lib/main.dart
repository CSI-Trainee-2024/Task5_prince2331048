import 'package:coffee_app_v2/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app_v2/size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(context);
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splashscreen(),
        );
      },
    );
  }
}
