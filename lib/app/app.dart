import 'package:app/screen/calculator_screen.dart';
import 'package:flutter/material.dart';






class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DashboardScreen(),
      // home: AreaCircleScreen(),
      // home: iconScreen(),
      // home: MyColumn(),
      home: CalculatorScreen(),
    );
  }
}
