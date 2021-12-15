import 'package:command_pattern/5/base_command.dart';
import 'package:command_pattern/5/commands/duck_command.dart';
import 'package:command_pattern/5/commands/jump_command.dart';
import 'package:command_pattern/5/commands/shoot_command.dart';
import 'package:command_pattern/5/commands/swap_weapon_command.dart';
import 'package:command_pattern/5/undoable_control_pad.dart';
import 'package:flutter/material.dart';

class FifthMainScreen extends StatefulWidget {
  const FifthMainScreen({Key? key}) : super(key: key);

  @override
  State<FifthMainScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthMainScreen> {
  late final BaseCommand aCommand;
  late final BaseCommand bCommand;
  late final BaseCommand xCommand;
  late final BaseCommand yCommand;

  String text = '';

  _FifthScreenState() {
    _readButtonsSetup();
  }

  void _readButtonsSetup() {
    void printer(String action) {
      setState(() {
        text = action;
      });
    }

    aCommand = DuckCommand(printer);
    bCommand = JumpCommand(printer);
    xCommand = SwapWeaponCommand(printer);
    yCommand = ShootCommand(printer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Control Pad 5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 40),
            ),
            FifthControlPad(
              aCommand: aCommand,
              bCommand: bCommand,
              xCommand: xCommand,
              yCommand: yCommand,
            ),
          ],
        ),
      ),
    );
  }
}
