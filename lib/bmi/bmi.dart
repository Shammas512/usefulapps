import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController weightcontoller = TextEditingController();
  final TextEditingController feetcontoller = TextEditingController();
  final TextEditingController inchcontoller = TextEditingController();
  String result = "";
  
  Color backgroundcolor = Colors.deepPurple;

  calculatebmi() {
    if (weightcontoller.text.isNotEmpty &&
        inchcontoller.text.isNotEmpty &&
        feetcontoller.text.isNotEmpty) {
      double totalweight = double.parse(weightcontoller.text);
      int inch = int.parse(inchcontoller.text);
      int feet = int.parse(feetcontoller.text);
      weightcontoller.clear();
      inchcontoller.clear();
      feetcontoller.clear();

      int height = (feet * 12) + inch;
      double totalheight = height * 0.0254;

      double totalbmi = totalweight / (totalheight * totalheight);
      if (totalheight > 0) {
        double bmi = totalweight / (totalheight * totalheight);
        setState(() {
          result = getBMIMessage(bmi);
          backgroundcolor = getbackground(bmi);
        });
      } else {
        result = "Plz Fill Text Fields";
        
      }
    } else {
      String result = "Plz Fill text fields";
    }
  }

  String getBMIMessage(double bmi) {
    if (bmi < 18) {
      return " underweight${bmi.toStringAsFixed(2)}";
    } else if (bmi >= 18 && bmi < 25) {
      return " Normal BMI ${bmi.toStringAsFixed(2)}";
    } else if (bmi >= 25 && bmi < 30) {
      return " Overweight ${bmi.toStringAsFixed(2)}";
    } else {
      return " Obese ${bmi.toStringAsFixed(2)}";
    }
  }

  Color getbackground(double bmi) {
    if (bmi >= 18 && bmi < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: const Text(
          "Bmi Calculator  ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 20,
              color: Colors.white30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Calculate Your BMI",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 90),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: weightcontoller,
                        decoration: const InputDecoration(
                          labelText: "Enter Your height in kg",
                          prefixIcon: Icon(Icons.line_weight),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pink), // Border when focused
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: feetcontoller,
                        decoration: const InputDecoration(
                          labelText: "Enter Your Feets",
                          prefixIcon: Icon(Icons.height),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.pinkAccent), // Border when focused
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: inchcontoller,
                        decoration: const InputDecoration(
                          labelText: "Enter Your Inch",
                          prefixIcon: Icon(Icons.height_sharp),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            calculatebmi();
                          },
                          child: const Text("Calculate BMI"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        result.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
