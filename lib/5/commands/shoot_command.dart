import 'package:command_pattern/5/base_command.dart';

class ShootCommand implements BaseCommand {
  void Function(String action) printer;

  ShootCommand(this.printer);

  @override
  void execute() {
    printer("Disparar");
  }

  @override
  void undo() {
    printer("Desdisparar");
  }
}
