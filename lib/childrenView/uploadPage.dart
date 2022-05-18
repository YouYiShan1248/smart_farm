import 'package:flutter/material.dart';
class uploadPage extends StatefulWidget {
  const uploadPage({Key? key}) : super(key: key);

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("uploadPage"),),
    );
  }
}
