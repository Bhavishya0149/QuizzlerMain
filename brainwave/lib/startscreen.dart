import 'package:flutter/material.dart';
// import 'questionscreen.dart';
// import 'main.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onPressed;
  
  const StartScreen(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('images/quizlogo.png', color: const Color.fromARGB(166, 255, 255, 255),)
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                style: TextStyle(
                  fontSize: 25
                  ,
                  color:Colors.white,
                ),
                "Learn Flutter"
              )
            ),
            OutlinedButton.icon(
              onPressed: onPressed, 
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
            )
        ],
      ),
    );
  }
}