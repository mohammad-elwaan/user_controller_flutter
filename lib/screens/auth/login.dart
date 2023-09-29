import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: ListView(

        children: [
          Container(

            height: 200,

            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Color(0xFF97DEFF),
                    Color(0xFF79E0EE),

                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
            ),

            alignment: Alignment.center,

            child:  Image.asset("images/logo.png"),

          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
            ),

            child: ListView(
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Color(0xFF97DEFF),
                          Color(0xFF79E0EE),

                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                  ),
                ),
              ],
            ),
          ),

        ],

      ),


    );
  }
}
