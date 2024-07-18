import 'package:flutter/material.dart';
import 'startscreen.dart';
import 'questionscreen.dart';
import 'resultscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toResultScreen(List <String> ans, List <Question> ques){
    setState(() {
      currentScreen = Resultscreen(switchScreen, ans, ques);
    });
  }
  void switchScreen(){
    setState(() {
      currentScreen = QuestionScreen(toResultScreen);
    });
  }
  
  late Widget currentScreen = StartScreen(switchScreen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple
              ],
            )
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}