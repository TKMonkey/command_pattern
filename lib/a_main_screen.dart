import 'package:command_pattern/a_control_pad.dart';
import 'package:flutter/material.dart';

class FirstMainScreen extends StatefulWidget {
  FirstMainScreen({Key? key}) : super(key: key);

  @override
  State<FirstMainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<FirstMainScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Control Pad 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 40),
            ),
            FirstControlPad(
              printer: (String newText) {
                setState(() {
                  text = newText;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
