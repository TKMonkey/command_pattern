import 'dart:math';

import 'package:command_pattern/3/actors/hero_actor.dart';
import 'package:command_pattern/3/actors/villain_actor.dart';
import 'package:command_pattern/3/base_actor.dart';
import 'package:command_pattern/3/base_command.dart';
import 'package:flutter/material.dart';

const double eighthRotation = pi / 4;

class ThirdControlPad extends StatefulWidget {
  final BaseCommand aCommand;
  final BaseCommand bCommand;
  final BaseCommand xCommand;
  final BaseCommand yCommand;

  ThirdControlPad({
    this.aCommand = NullCommand.instance,
    this.bCommand = NullCommand.instance,
    this.xCommand = NullCommand.instance,
    this.yCommand = NullCommand.instance,
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdControlPad> createState() => _ThirdControlPadState();
}

class _ThirdControlPadState extends State<ThirdControlPad> {
  final heroActor = HeroActor();
  final villainActor = VillainActor();
  late BaseActor currentActor = heroActor;

  late BaseCommand commandToExecute = NullCommand.instance;

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
                        onPressed: () => commandToExecute = widget.yCommand,
                      ),
                      buttonsSpace,
                      PadButton(
                        text: "X",
                        color: const Color.fromRGBO(31, 76, 157, 1),
                        onPressed: () => commandToExecute = widget.xCommand,
                      )
                    ],
                  ),
                  buttonsSpace,
                  Row(
                    children: [
                      PadButton(
                        text: "B",
                        color: const Color.fromRGBO(205, 176, 64, 1),
                        onPressed: () => commandToExecute = widget.bCommand,
                      ),
                      buttonsSpace,
                      PadButton(
                        text: "A",
                        color: const Color.fromRGBO(212, 54, 46, 1),
                        onPressed: () => commandToExecute = widget.aCommand,
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
                onPressed: () {
                  currentActor = villainActor;
                },
                child: const Text(
                  "Villano",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    currentActor = heroActor;
                  },
                  child: const Text(
                    "Héroe",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: TextButton(
              child: Text("Ejecutar acción"),
              onPressed: () => commandToExecute.execute(currentActor),
            ),
          )
        ],
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
