import 'package:flutter/material.dart';
import 'package:weather_app_v1/SelectMainService/select_main_service_type_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelectMainServiceTypeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
