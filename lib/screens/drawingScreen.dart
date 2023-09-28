import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawingScreen extends StatefulWidget {
  DrawingScreen({Key? key});

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Area'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                height: 46,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
