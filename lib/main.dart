import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/theme/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static bool isSwitched = false;

  void changeTheme() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: isSwitched ? Palette.darkTheme : Palette.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    isSwitched = !isSwitched;
                  },
                );
              },
              splashRadius: 0.1,
              icon: Icon(
                isSwitched ? Icons.wb_sunny : Icons.nightlight_round,
                color: isSwitched ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        body: HomePage(isSwitched: isSwitched),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
