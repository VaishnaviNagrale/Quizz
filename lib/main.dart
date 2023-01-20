import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  State<_MyApp> createState() => _MyAppState();
}
QuestionBrain Brain= new QuestionBrain();
class _MyAppState extends State<_MyApp> {
  List<Widget> scorekeeper = [];

  void checkAnswer(bool userPinked) {
    bool corectAns = Brain.getQuestionAns();
    setState(() {
      if (Brain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You have reached the end of quiz',
        ).show();
        Brain.rest();
        scorekeeper.clear();
      } else {
        if (userPinked == corectAns) {
          scorekeeper.add(Icon(Icons.check, color: Colors.green, size: 25.0,),);
        } else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red, size: 25.0,),);
        }
        Brain.getNextQuestion();
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Quizz', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      Brain.getQuestiontext(),
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.green),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white, fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Text(
                        'False',
                        style: TextStyle(
                          color: Colors.white, fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: scorekeeper,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
