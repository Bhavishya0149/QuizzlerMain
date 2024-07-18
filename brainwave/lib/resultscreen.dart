import 'package:flutter/material.dart';
import 'questionscreen.dart';

class Resultscreen extends StatefulWidget {
  final List <String> ans;
  final List <Question> ques;

  final VoidCallback restartQuiz;

  const Resultscreen(this.restartQuiz, this.ans, this.ques, {super.key});

  List <Widget> generate(){
    List <Widget> res = [];
    res.add(const Divider(
      color: Colors.white,
    ));

    for(int i = 0; i < ans.length; i++){
    res.add(OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          side: BorderSide.none,
          foregroundColor: Colors.white,
        ),
        onPressed: () {}, 
        label: Text('Selected : ${ans[i]}\nCorrect : ${ques[i].ans[0]}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        icon: (ans[i] == ques[i].ans[0]) 
        ? const Icon(Icons.check, color: Color.fromARGB(255, 4, 102, 7), size: 40,) 
        : const Icon(Icons.close, color: Colors.red, size: 40,),
      )
    );
    res.add(const Divider(
      color: Colors.white,
    ));
    res.add(const SizedBox(
      height: 10,
    ));
  }

  return res;
}

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    int correct = 0; int total = 0;
    
    for(int i = 0; i < widget.ans.length; i++){
      if(widget.ans[i] == widget.ques[i].ans[0]) correct++;
      total++;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$correct/$total questions answered correctly.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.generate(),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: widget.restartQuiz, 
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Attempt Again'),
          )
        ],
      ),
    );
  }
}