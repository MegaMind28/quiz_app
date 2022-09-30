import 'package:flutter/material.dart';

import 'api_services.dart';

class KnowledgeScreen extends StatefulWidget {
  const KnowledgeScreen({Key key}) : super(key: key);

  @override
  State<KnowledgeScreen> createState() => _KnowledgeScreenState();
}

class _KnowledgeScreenState extends State<KnowledgeScreen> {

   Future quiz;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz = getQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFf2f3f6),
          body: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data["centres"];

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(padding: EdgeInsets.all(10),
                        child: Container(
                          color: Colors.white,
                         // height:25,
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Name : ',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF3c61fa),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: data[index]['name'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF31343c),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 10,),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Place : ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF3c61fa),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]['Place'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF31343c),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 10,),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'State : ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF3c61fa),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]['State'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF31343c),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              //  Text('Name + ${data[index]['name']}')
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                );
              }
            },
          ),
        ));

  }
}
