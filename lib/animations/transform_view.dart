import 'package:flutter/material.dart';

class TransFormExample extends StatefulWidget {
  @override
  _TransFormExampleState createState() => _TransFormExampleState();
}

class _TransFormExampleState extends State<TransFormExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Transform.rotate(
            angle: 1.0,
            origin: Offset(0, 0),
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
            ),
          ),


        ],
      )),
    );
  }
}
