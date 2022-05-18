import 'package:flutter/material.dart';
class minePage extends StatefulWidget {
  const minePage({Key? key}) : super(key: key);

  @override
  State<minePage> createState() => _minePageState();
}

class _minePageState extends State<minePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("minePage"),),
    );
  }
}
