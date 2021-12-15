import 'package:command_pattern/1/wired_main_screen.dart';
import 'package:command_pattern/2/swappable_main_screen.dart';
import 'package:command_pattern/3/parameterized_main_screen.dart';
import 'package:command_pattern/4/replayable_main_screen.dart';
import 'package:command_pattern/5/undoable_main_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FirstMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Hard-wired Command",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SecondMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Swappable Command",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ThirdMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Swappable Actor Command",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FourthMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Replayable Command",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FifthMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Undoable Command",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
