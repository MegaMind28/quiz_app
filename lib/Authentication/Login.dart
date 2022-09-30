import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AuthService.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ISRO Quiz App',style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF3c61fa),
                  fontWeight: FontWeight.w800,
                ),),
                SvgPicture.asset('assets/space.svg',height: 200,width: 200,),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    AuthService().signInWithGoogle();
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration:  BoxDecoration(
                      // color: Colors.lightBlueAccent,
                        border: Border.all(
                            color: Colors.lightBlue
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [

                          Text('Login With Google')
                        ],
                      ),
                    ),
                  )
                ),
              ],
            ),
          )


        ));
  }
}
