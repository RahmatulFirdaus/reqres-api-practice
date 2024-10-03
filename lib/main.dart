import 'package:flutter/material.dart';
import 'package:reqres_project/pages/mainPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Reqres",
      // theme: ThemeData.light(),
      home: MainPages(),
    );
  }
}