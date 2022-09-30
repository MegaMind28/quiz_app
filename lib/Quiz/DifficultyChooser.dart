import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isro_quiz/Quiz/QuizScreen.dart';

class DifficultyChooser extends StatefulWidget {
  const DifficultyChooser({Key key}) : super(key: key);

  @override
  State<DifficultyChooser> createState() => _DifficultyChooserState();
}

class _DifficultyChooserState extends State<DifficultyChooser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20),
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
                                color:  Color(0xFF3c61fa),
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

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Text('ISRO Quiz',style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF3c61fa),
                        fontWeight: FontWeight.w800,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    SvgPicture.asset('assets/space.svg',height: 200,width: 200,),
                    SizedBox(height: 20,),
                    Text( 'Choose Your Level',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuizScreen()));
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
                                  color:  Color(0xFF3c61fa)
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [

                                Text('Easy Level')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuizScreen()));

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
                                  color:  Color(0xFF3c61fa)
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Text('Medium Level')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuizScreen()));
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
                                  color:  Color(0xFF3c61fa)
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [

                                Text('Difficult Level')
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),)
              ],
            ),
          ),
        ));
  }
}
