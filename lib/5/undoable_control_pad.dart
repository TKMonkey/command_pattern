import 'dart:math';

import 'package:command_pattern/5/base_command.dart';
import 'package:flutter/material.dart';

const double eighthRotation = pi / 4;

class FifthControlPad extends StatefulWidget {
  final BaseCommand aCommand;
  final BaseCommand bCommand;
  final BaseCommand xCommand;
  final BaseCommand yCommand;

  const FifthControlPad({
    this.aCommand = NullCommand.instance,
    this.bCommand = NullCommand.instance,
    this.xCommand = NullCommand.instance,
    this.yCommand = NullCommand.instance,
    Key? key,
  }) : super(key: key);

  @override
  State<FifthControlPad> createState() => _FifthControlPadState();
}

class _FifthControlPadState extends State<FifthControlPad> {
  final List<BaseCommand> playedActions = [];
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Transform.rotate(
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
                        onPressed: () {
                          _executeAndAddCommand(widget.yCommand);
                        },
                      ),
                      buttonsSpace,
                      PadButton(
                        text: "X",
                        color: const Color.fromRGBO(31, 76, 157, 1),
                        onPressed: () {
                          _executeAndAddCommand(widget.xCommand);
                        },
                      )
                    ],
                  ),
                  buttonsSpace,
                  Row(
                    children: [
                      PadButton(
                        text: "B",
                        color: const Color.fromRGBO(205, 176, 64, 1),
                        onPressed: () {
                          _executeAndAddCommand(widget.bCommand);
                        },
                      ),
                      buttonsSpace,
                      PadButton(
                        text: "A",
                        color: const Color.fromRGBO(212, 54, 46, 1),
                        onPressed: () {
                          _executeAndAddCommand(widget.aCommand);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: currentIndex > -1
                    ? () {
                        _undoAction();
                      }
                    : null,
                child: const Text(
                  "Undo",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: currentIndex < playedActions.length - 1
                      ? () {
                          _redoAction();
                        }
                      : null,
                  child: const Text(
                    "Redo",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ],
      );

  void _executeAndAddCommand(BaseCommand command) {
    command.execute();
    playedActions.removeRange(currentIndex + 1, playedActions.length);
    playedActions.add(command);
    setState(() {
      currentIndex++;
    });
  }

  void _undoAction() {
    final command = playedActions.elementAt(currentIndex);
    setState(() {
      currentIndex--;
    });
    command.undo();
  }

  void _redoAction() {
    setState(() {
      currentIndex++;
    });
    final command = playedActions.elementAt(currentIndex);
    command.execute();
  }
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
