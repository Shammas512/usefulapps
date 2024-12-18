import 'package:flutter/material.dart';
import 'package:usefulapps/Calculator/Calculator_Screen.dart';
import 'package:usefulapps/bmi/bmi.dart';
import 'package:usefulapps/Electricity/electricity_bill.dart';
import 'package:usefulapps/TodoApp/todo.dart';
import 'package:usefulapps/usefulappsall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
     
      home:Usefulapps(),
      debugShowCheckedModeBanner: false,
      
      
    );
  }
}




