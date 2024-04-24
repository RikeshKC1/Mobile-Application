import 'package:app/model/calculator_model.dart';
import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int? first;
  int? second;
  int result = 0;
  ArithmeticModel? arithmeticModel;

  final mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text("Calculator Rikesh"),
        backgroundColor: Color.fromARGB(255, 144, 145, 180),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: mykey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter first No';
                }
                return null;
              },
              onChanged: (value) {
                first = int.tryParse(value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter First No',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter second No';
                }
                return null;
              },
              onChanged: (value) {
                second = int.tryParse(value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Second No',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (mykey.currentState!.validate()) {
                    setState(() {
                      arithmeticModel =
                          ArithmeticModel(first: first!, second: second!);
                      result = arithmeticModel!.add();
                    });
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20, // Change the font size
                    fontWeight: FontWeight.bold, // Apply bold font weight
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (mykey.currentState!.validate()) {
                    setState(() {
                      result = (first ?? 0) - (second ?? 0);
                    });
                  }
                },
                child: const Text(
                  "Sub",
                  style: TextStyle(
                    fontSize: 20, // Change the font size
                    fontWeight: FontWeight.bold, // Apply bold font weight
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (mykey.currentState!.validate()) {
                    setState(() {
                      arithmeticModel =
                          ArithmeticModel(first: first!, second: second!);
                      result = arithmeticModel!.multiply();
                    });
                  }
                },
                child: const Text(
                  "Multiply",
                  style: TextStyle(
                    fontSize: 20, // Change the font size
                    fontWeight: FontWeight.bold, // Apply bold font weight
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (mykey.currentState!.validate()) {
                    setState(() {
                      arithmeticModel =
                          ArithmeticModel(first: first!, second: second!);
                      try {
                        result = arithmeticModel!.divide().toInt();
                      } catch (e) {
                        // Handle division by zero error
                        result = double.nan.toInt();
                      }
                    });
                  }
                },
                child: const Text(
                  "Divide",
                  style: TextStyle(
                    fontSize: 20, // Change the font size
                    fontWeight: FontWeight.bold, // Apply bold font weight
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Result is : $result',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
