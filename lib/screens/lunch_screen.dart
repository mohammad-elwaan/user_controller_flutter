import 'dart:ui';

import 'package:flutter/material.dart';


void main() {
  runApp(const LunchScreen());
}


class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(

          body: Container(

            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Color(0xFF97DEFF),
                    Color(0xFF79E0EE),

                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),

            alignment: Alignment.centerRight,

                child:  ImageFiltered(
                  imageFilter: ImageFilter.blur(),
                  child: Image.asset("images/lunch.png"),
            ),
          ),

    );
  }
}
