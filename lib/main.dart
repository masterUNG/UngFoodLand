import 'package:flutter/material.dart';
import 'package:ung_food_land/screens/authen.dart';



void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Authen());
  }
}