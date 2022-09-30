import 'package:flutter/material.dart';
import 'package:isro_quiz/HomeScreens/HomeContent.dart';

import '../Authentication/AuthService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFf2f3f6),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome to ',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF31343c),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ISRO \n',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF3c61fa),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Quiz!',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF31343c),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  AuthService().signOut();
                                },
                                icon: Icon(
                                  Icons.logout,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                                color: Colors.lightBlue,
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
               HomeConmtent()
               // TopTenWidget(),
              ],
            ),
          ),
        ),
    );
  }
}
