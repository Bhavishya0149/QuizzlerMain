import 'package:flutter/material.dart';

class Question{
  const Question(this.ques, this.ans);

  final String ques;
  final List <String> ans;
}
class QuestionScreen extends StatefulWidget {
  final void Function(List <String> , List <Question>) toResultScreen;
  const QuestionScreen(this.toResultScreen, {super.key});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> { 
  final List <Question> ques = [
    const Question('What language is this app made in?', 
      ['Dart', 'C++', 'Java', 'Python',]
    ),
    const Question('Software Used?', 
      ['VS Code', 'Online Compiler', 'Notepad', 'MS Word',]
    ),
    const Question('Acceptable time complexity for n <= 1e5?', 
      ['nlogn', 'n!', 'n * n', 'n * n * n',]
    ),
    const Question('WHat new feature added into C++ from C?', 
      ['Classes', 'Functions', 'Operators', 'Pointers',]
    ),
    const Question('What does every question have?', 
      ['Question mark', 'An answer', 'Marks', 'Meaning',]
    ),
  ];

  int currentIndex = 0;

  List <String> selectedAns = [];
  @override
  Widget build(BuildContext context) {
    List <String> currentQuesAns = List.from(ques[currentIndex].ans);
    currentQuesAns.shuffle();

    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ques[currentIndex].ques,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: currentQuesAns.length,
            itemBuilder: (context, index){
            return OutlinedButton(
              onPressed: () {
                if(currentIndex < ques.length - 1){
                  setState(() { 
                      selectedAns.add(currentQuesAns[index]);
                      currentIndex++;
                  });
                } else {
                    selectedAns.add(currentQuesAns[index]);
                    widget.toResultScreen(selectedAns, ques);
                }
              },  
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(161, 236, 91, 236)
              ),  
              child: Text(currentQuesAns[index]),
            );
              
          })
        ],
      ),
    );
  }
}