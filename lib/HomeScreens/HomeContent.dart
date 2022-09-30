import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isro_quiz/KnowledgeSection/KnowledgeScreen.dart';
import 'package:isro_quiz/Quiz/DifficultyChooser.dart';

class HomeConmtent extends StatefulWidget {
  const HomeConmtent({Key key}) : super(key: key);

  @override
  State<HomeConmtent> createState() => _HomeConmtentState();
}

class _HomeConmtentState extends State<HomeConmtent> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50,),
                SvgPicture.asset('assets/kids.svg',height: 300,width: 300,),
                SizedBox(height:3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DifficultyChooser()));
                          },
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
                                  Text('Play Quiz')
                                ],
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  KnowledgeScreen()));

                          },
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
                                  Text('Knowledge Section')
                                ],
                              ),
                            ),
                          )
                      ),

                    ],
                  ),
                ),
                // SizedBox(height: kSpacingUnit * 1),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
