import 'package:flutter/material.dart';
import 'bmiCalculatorScreen.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculatorScreen(),
      
    );
  }
}