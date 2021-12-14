import 'package:command_pattern/2/base_command.dart';
import 'package:command_pattern/2/commands/duck_command.dart';
import 'package:command_pattern/2/commands/jump_command.dart';
import 'package:command_pattern/2/commands/shoot_command.dart';
import 'package:command_pattern/2/commands/swap_weapon_command.dart';
import 'package:command_pattern/2/swappable_control_pad.dart';
import 'package:flutter/material.dart';

class SecondMainScreen extends StatefulWidget {
  const SecondMainScreen({Key? key}) : super(key: key);

  @override
  State<SecondMainScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondMainScreen> {
  late final BaseCommand aCommand;
  late final BaseCommand bCommand;
  late final BaseCommand xCommand;
  late final BaseCommand yCommand;

  String text = '';

  _SecondScreenState() {
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
        title: const Text("Control Pad 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 40),
            ),
            SecondControlPad(
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
