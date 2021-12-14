import 'dart:math';

import 'package:command_pattern/2/base_command.dart';
import 'package:flutter/material.dart';

const double eighthRotation = pi / 4;

class SecondControlPad extends StatelessWidget {
  final BaseCommand aCommand;
  final BaseCommand bCommand;
  final BaseCommand xCommand;
  final BaseCommand yCommand;

  const SecondControlPad({
    this.aCommand = NullCommand.instance,
    this.bCommand = NullCommand.instance,
    this.xCommand = NullCommand.instance,
    this.yCommand = NullCommand.instance,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Transform.rotate(
        angle: -eighthRotation,
        child: SizedBox(
          height: 150,
          width: 150,
          child: Column(
            children: [
              Row(
                children: [
                  PadButton(
                    text: "Y",
                    color: const Color.fromRGBO(63, 141, 110, 1),
                    onPressed: yCommand.execute,
                  ),
                  buttonsSpace,
                  PadButton(
                    text: "X",
                    color: const Color.fromRGBO(31, 76, 157, 1),
                    onPressed: xCommand.execute,
                  )
                ],
              ),
              buttonsSpace,
              Row(
                children: [
                  PadButton(
                    text: "B",
                    color: const Color.fromRGBO(205, 176, 64, 1),
                    onPressed: bCommand.execute,
                  ),
                  buttonsSpace,
                  PadButton(
                    text: "A",
                    color: const Color.fromRGBO(212, 54, 46, 1),
                    onPressed: aCommand.execute,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class PadButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;

  const PadButton({
    required this.text,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: MaterialButton(
        shape: const CircleBorder(),
        color: color,
        child: Transform.rotate(
          angle: eighthRotation,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

const buttonsSpace = SizedBox(
  height: 10,
  width: 10,
);
