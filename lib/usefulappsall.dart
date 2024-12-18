import 'package:flutter/material.dart';
import 'package:usefulapps/Calculator/Calculator_Screen.dart';
import 'package:usefulapps/bmi/bmi.dart';
import 'package:usefulapps/Electricity/electricity_bill.dart';
import 'package:usefulapps/TodoApp/todo.dart';

class Usefulapps extends StatefulWidget {
  const Usefulapps({super.key});

  @override
  State<Usefulapps> createState() => _UsefulappsState();
}

class _UsefulappsState extends State<Usefulapps> {
  List<Widget> pages = [
     const CalculatorScreen(),
    const Bill(),
    const TodoApp(),
    const Bmi(),
  ];
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        elevation: 3,
     backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      
       selectedItemColor: Colors.amber,
     
        currentIndex: currentpage,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Calculator"),
          BottomNavigationBarItem(
              icon: Icon(Icons.blinds_closed), label: "Electriciy"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: " Todo"),
            BottomNavigationBarItem(icon: Icon(Icons.accessibility_sharp), label: " BMI"),
        ],
      ),
    );
  }
}
