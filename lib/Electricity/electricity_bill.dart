import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({super.key});

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  double unitrate = 23.59;
  final TextEditingController _unitController = TextEditingController();
  double totalBill = 0.0;
  

  void calculateBill() {
    int units = int.tryParse(_unitController.text) ?? 0;
    

    if (units >= 200) {
      unitrate = 34.26; // Highest unit rate
    } else if (units >= 100) {
      unitrate = 30.07;
    } else {
      unitrate = 23.59; // Default rate
    }

    setState(() {
      totalBill = units * unitrate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFFFFFF),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display unit or a default message if empty
                    Text(
                      _unitController.text.isEmpty
                          ? "Units"
                          : _unitController.text,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _unitController,
              decoration: const InputDecoration(
                  hintText: "Enter Your Units", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                calculateBill();
                
              },
              child: const Text("Calculate Bill"),
            ),
            const SizedBox(height: 30),
            Text(
              totalBill > 0
                  ? "Total Bill Pkr: ${totalBill.toStringAsFixed(2)}"
                  : "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
