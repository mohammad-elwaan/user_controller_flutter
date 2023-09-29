import 'dart:ui';

import 'package:flutter/material.dart';


class OutboardingContent extends StatelessWidget {


  final String title;
  final String body;
  final String body2;


  OutboardingContent(
      {required this.title,
        required this.body,
        required this.body2
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded(
          child: Container(

            child: ImageFiltered(
              imageFilter: ImageFilter.blur(),
              child: Image.asset(title),
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),

        Text(body,style:
        TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.lightBlue)
        ),

        Text(body2,style:
        TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.lightBlue)
        ),

      ],
    );
  }
}