import 'package:flutter/material.dart';
import 'package:quize_app/qiuzBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Quiz"),
      ),
      body: const SafeArea(child: appBody()),
    ),
  ));
}

class appBody extends StatefulWidget {
  const appBody({super.key});

  @override
  State<appBody> createState() => _appBodyState();
}

class _appBodyState extends State<appBody> {
  List<Icon> scorekeeper = [];
  int qesutionIndex = 0;
  int score = 0;
  QuizBrain newbrain = QuizBrain();

  void checkAnswer(bool givenAnswer) {
    if (newbrain.getQuestionAnswer() == givenAnswer) {
      scorekeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      score++;
    } else {
      scorekeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    newbrain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            margin: EdgeInsets.only(top: 10),
            width: 400,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    newbrain.previousQestion();
                    scorekeeper.removeLast();


                  });
                },
                style: ButtonStyle(),
                child: ExcludeFocus(
                    child: Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
          Expanded(
            child: Center(
              child: Text(
                newbrain.getQuestionText(),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green[500],
            height: 70,
            margin: const EdgeInsets.only(bottom: 20),
            width: 400,
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(true);

                  if(newbrain.isOver()){
                    Alert(
                      context: context,
                      title: "Quiz is Done...",
                      desc: "you have scored $score",
                    ).show();
                    score=0;
                    scorekeeper.removeRange(0, newbrain.getLengthOfList());
                  }
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            margin: const EdgeInsets.only(bottom: 40),
            width: 400,
            height: 70,
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  if(newbrain.isOver()){
                    Alert(
                      context: context,
                      title: "Quiz is Done...",
                      desc: "you have scored $score",
                    ).show();
                    scorekeeper.removeRange(0, newbrain.getLengthOfList());
                    score=0;
                  }
                });
              },
              child: const Text(
                'false',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: scorekeeper,
            ),
          )
        ],
      ),
    );
  }
}
