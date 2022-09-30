import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isro_quiz/Quiz/DifficultyChooser.dart';
import 'package:isro_quiz/Quiz/ResultScreen.dart';
import 'package:isro_quiz/Quiz/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  var currentQuestionIndex = 0;
  int seconds = 10;
  Timer timer;
  int points = 0;

  var isLoaded = false;

  var optionsList = [];

  void initState() {
    super.initState();
    optionsList=[];
    loadOptions();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          // print('paused');
          optionsList=[];
          gotoNextQuestion();
          // currentQuestionIndex++;

        }
      });
    });
  }

  gotoNextQuestion() {

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        optionsList = [];
        currentQuestionIndex++;
        loadOptions();
        timer.cancel();
        seconds = 10;
        startTimer();
      });
    } else {
      print('Switching To Result Screen');
      print('timeOut');
      timer.cancel();
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResulttScreen(points)));
      //here you can do whatever you want with the results
    }
  }

  loadOptions(){
    optionsList.addAll(questions[currentQuestionIndex].incorrect_answers);
    optionsList.add(questions[currentQuestionIndex].correct_answer);
    optionsList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:20,left: 20.0,right: 20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: 100,
                            //width: 300,
                            decoration: const BoxDecoration(
                                color: Color(0xFF3c61fa),
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.arrow_back,
                                    color: Color(0xFFf2f2f2),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('BACK',style: TextStyle(
                                      color: Color(0xFFf2f2f2)
                                  ),)
                                ],
                              ),
                            ),
                          ),

                          Stack(
                              alignment: Alignment.center,
                              children:[
                                Text("$seconds"),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    value: seconds / 10,
                                    valueColor: const AlwaysStoppedAnimation(Color(0xFF3c61fa)),
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:20,
                    ),
                    SvgPicture.asset('assets/space.svg',height: 200,width: 200,),
                    SizedBox(
                      height:20,
                    ),
                    Row(
                      children: [
                        Text('Question ${currentQuestionIndex + 1} of ${questions.length}',
                            style: TextStyle(
                                fontSize: 17
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [

                        Expanded(
                          child: Text( questions[currentQuestionIndex].question,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              )),
                        ),


                      ],
                    ),

                    SizedBox(height: 20,),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionsList.length,
                      itemBuilder: (BuildContext context, int index) {

                        var answer = questions[currentQuestionIndex].correct_answer;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (answer.toString() == optionsList[index].toString()) {
                                // optionsColor[index] = Colors.green;
                                points = points + 10;
                              }

                              if (currentQuestionIndex < questions.length - 1) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  print('NextQuestion');
                                  gotoNextQuestion();
                                });
                              } else {
                                print('Switching To Result Screen');
                                print('timeOut');
                                timer.cancel();
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResulttScreen(points)));
                                //here you can do whatever you want with the results
                              }
                            });
                          },
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration:  BoxDecoration(
                                // color: Colors.lightBlueAccent,
                                  border: Border.all(
                                      color: Color(0xFF3c61fa)
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      // color: Colors.lightBlue,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF3c61fa),
                                          borderRadius: BorderRadius.all(Radius.circular(50))
                                      ),
                                      child: Center(
                                        child: Text(index.toString(),style: TextStyle(
                                          color: Colors.white
                                        ),),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(optionsList[index].toString())
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
        ) );
  }
  }

