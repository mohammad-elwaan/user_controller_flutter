import 'package:flutter/material.dart';

//الدوائر التي في اسفل الصفحة

class PageViewContainerOutboarding extends StatelessWidget {

  final double marginEnd;
  final bool selected;


  PageViewContainerOutboarding({this.marginEnd = 0 ,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //لونهم هكذا لانهم ليسوا مختارين
       // color: Colors.grey.shade500,
        color: selected ?  Colors.blue.shade500 :  Colors.grey.shade500,

      ),
    );
  }
}