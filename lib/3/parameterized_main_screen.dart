import 'package:command_pattern/3/base_command.dart';
import 'package:command_pattern/3/commands/duck_command.dart';
import 'package:command_pattern/3/commands/jump_command.dart';
import 'package:command_pattern/3/commands/shoot_command.dart';
import 'package:command_pattern/3/commands/swap_weapon_command.dart';
import 'package:command_pattern/3/parameterized_control_pad.dart';
import 'package:flutter/material.dart';

class ThirdMainScreen extends StatefulWidget {
  const ThirdMainScreen({Key? key}) : super(key: key);

  @override
  State<ThirdMainScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdMainScreen> {
  late final BaseCommand aCommand;
  late final BaseCommand bCommand;
  late final BaseCommand xCommand;
  late final BaseCommand yCommand;

  String text = '\n';

  _ThirdScreenState() {
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
        title: const Text("Swappable Actor Command"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 40),
            ),
            ThirdControlPad(
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
