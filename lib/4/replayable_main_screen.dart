import 'package:command_pattern/4/base_command.dart';
import 'package:command_pattern/4/commands/duck_command.dart';
import 'package:command_pattern/4/commands/jump_command.dart';
import 'package:command_pattern/4/commands/shoot_command.dart';
import 'package:command_pattern/4/commands/swap_weapon_command.dart';
import 'package:command_pattern/4/replayable_control_pad.dart';
import 'package:flutter/material.dart';

class FourthMainScreen extends StatefulWidget {
  const FourthMainScreen({Key? key}) : super(key: key);

  @override
  State<FourthMainScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthMainScreen> {
  late final BaseCommand aCommand;
  late final BaseCommand bCommand;
  late final BaseCommand xCommand;
  late final BaseCommand yCommand;

  String text = '';

  _FourthScreenState() {
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
        title: const Text("Control Pad 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 40),
            ),
            FourthControlPad(
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
