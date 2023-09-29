import 'package:flutter/material.dart';
import 'package:flutter_serviceprovider_customer2/screens/auth/login.dart';
import 'package:flutter_serviceprovider_customer2/screens/customer/login_customer.dart';
import 'package:flutter_serviceprovider_customer2/screens/lunch_screen.dart';
import 'package:flutter_serviceprovider_customer2/screens/outboarding/outbourding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/lunch_screen',
      routes: {
        '/lunch_screen' : (context) => LunchScreen(),
        '/login_customer' : (context) => LoginCustomer(),
        '/out_boarding_screen' : (context) => OutBoardingScreenUiApp(),
        '/login' : (context) => Login(),
      },
    );
  }
}
