import 'package:command_pattern/1/wired_control_pad.dart';
import 'package:flutter/material.dart';

class FirstMainScreen extends StatefulWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  State<FirstMainScreen> createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hard-wired Command"),
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
