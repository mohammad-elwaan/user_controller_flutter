import 'package:flutter/material.dart';

import '../../wedgit/PageViewContainerOutboarding.dart';
import '../../wedgit/outboarding_wedgit.dart';



//واجهات تظهر عند فتح التطبيق لاول مرة
//يعني واجهات تعريفية
//وهي قسمين : outboarding screen وهي الواجهة الثابتة
//داخلها outboarding content وهي الواجهة المتقلبة داخلها

class OutBoardingScreenUiApp extends StatefulWidget {
  const OutBoardingScreenUiApp({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreenUiApp> createState() => _OutBoardingScreenUiAppState();
}

class _OutBoardingScreenUiAppState extends State<OutBoardingScreenUiApp> {

  int _currentIndex = 0;
  late PageController _pageController;

  //هذه الدالة حتى تعرف الايقونة في اي صفحة وحتى تتعامل مع التالي والرجوع؟
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =PageController(initialPage: 0);
  }

  //وهي اخر دالة يتم تنفيذها على عكس initState
  //تقوم بإلغاء حدث الاتصال
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //عبارة عن صفحة متقلبة مثل الاندرويد
      body: Column(
        children: [
          //*************************************************************************************
          //نقوم بانشاء زر skip

          //Visibility معناها كيفية الظهور للعنصر
          Visibility(
            //اظهر العنصر اذا كان لا يساوي 2
            visible: _currentIndex !=2,
            //اذا اختفى زر skip يظهر بداله زر في الاسفل
            replacement: Container(
              alignment: AlignmentDirectional.topEnd,
              margin: EdgeInsetsDirectional.only(top: 40 ,end: 20),
              child: TextButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/login');
              }, child: Text('START NOW',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
            ),

            //*****************************************************
            //حتى تبقى المساحة محجوزة للعنصر حتى لو اختفى
            //ترك المساحة كما هي
            // maintainSize: true,
            //عندما تظهر تقوم بعمل انيميشن بسيطة
            // maintainAnimation: true,
            //ترك الحالة على حالة الاخفاء
            // maintainState: true,
            //*****************************************************

            child: Container(
              alignment: AlignmentDirectional.topEnd,
              margin: EdgeInsetsDirectional.only(top: 40 ,end: 20),
              child: TextButton(onPressed: (){
                //معناها اجعلها تنقلني على رقم 2 مع انيميشن في مدة قدرها 0.5 ثانية
                _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              }, child: Text('SKIP',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
            ),
          ),
          //**************************************************************************************

          Expanded(
            child: PageView(

              controller: _pageController,
              //لمعرفة في اي صفحة نحن موجودين هل 0 ام 1 ام 2
              onPageChanged: (int value){
                setState(() {
                  _currentIndex = value;
                });
              },

              //لجعل اتجاه الواجهات من الاعلى للاسفل
              //scrollDirection: Axis.vertical,

              children: [
                // Container(
                //   color: Colors.red,
                // ),

                OutboardingContent(title: "images/out1.png" ,
                  body: "Fast reservation with technicians",body2: "and craftsmen",),
                OutboardingContent(title: "images/out2.png" ,
                  body: "Fast reservation with technicians",body2: "and craftsmen",),
                OutboardingContent(title: "images/out1.png" ,
                  body: "Fast reservation with technicians",body2: "and craftsmen",)
                ],
            ),
          ),

          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewContainerOutboarding(marginEnd: 10,selected: _currentIndex==0,),
                PageViewContainerOutboarding(marginEnd: 10, selected: _currentIndex==1,),
                PageViewContainerOutboarding(selected: _currentIndex == 2,),
              ],
            ),
          ),


          //نريد ان ننشئ زر رجوع و التالي
          //اذا كانت الصفحة الاولى فزر الرجوع لا يعمل
          //اذا كانت الصفحة الاخير فزر التالي لا يعمل
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(onPressed: (){

                  //تقوم بعمل انيميشن للتراجع مدته 1 ثانية
                  _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                    //معناها اذا كانت الصفحة الاولى اجعل الايقونة لونها قاتم
                    icon: Icon(Icons.arrow_back_ios_new,color: _currentIndex == 0 ? Colors.grey : Colors.blue,),
                    label: Text('')),
                TextButton.icon(onPressed: (){

                  //تقوم بعمل انيميشن للتالي مدته 1 ثانية
                  _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                  //تقوم بعمل أنيميشن عن التنقل من صفحة للثانية مدته 2 ثانية
                  //_pageController.animateToPage(_currentIndex + 1, duration: Duration(seconds: 2), curve: Curves.bounceIn);

                },
                    //معناها اذا كانت الصفحة الاخير اجعل اللون قاتم
                    icon: Icon(Icons.arrow_forward_ios,color: _currentIndex == 2 ? Colors.grey : Colors.blue,),
                    label: Text('')),
              ],
            ),
          ),

          //نضع زر في اسفل الصفحة
          Visibility(
            //اظهره اذا كان يساوي 2
            visible: _currentIndex ==2,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,

            child: Container(
              margin: EdgeInsetsDirectional.only(bottom: 30 , start: 20 , end: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('NEXT', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  //لجعله يأخذ عرض الشاشة وطول 50
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                ),
              ),
            ),
          )
        ],

      ),
    );
  }
}




