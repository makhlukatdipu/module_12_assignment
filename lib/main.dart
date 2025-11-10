import 'package:flutter/material.dart';

import 'assignment/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: home(
          isDarkMode: _isDarkMode,
        toggleTheme: toggleTheme),
      initialRoute: 'home',
      routes: {
        'home':(context)=>home(isDarkMode: _isDarkMode,
            toggleTheme: toggleTheme),
      },
    );
  }
}


