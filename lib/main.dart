import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

//void main() {
//  runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite Color?',
      'answers': ['Black', 'Red', 'White', 'Blue'],
    },
    {
      'questionText': 'What\'s your favorite Animal?',
      'answers': ['Rabbit', 'Elephant', 'Snake', 'Lion'],
    },
    {
      'questionText': 'What\'s your favorite Instructor?',
      'answers': ['Max', 'Bob', 'Sam', 'Rohit'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestions() {
    if (_questionIndex < questions.length) {
      print('We have More Questions!');
    } else {
      print('No MOre Questions!');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = ['Hello'];
    //dummy.add('MAx');
    //print(dummy);
    //questions=[]; //Does not work if the question is Constant
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    //questions.elementAt(0),
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestions, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You Did It'),
              ),
      ),
    );
  }
}
