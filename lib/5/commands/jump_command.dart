import 'package:command_pattern/5/base_command.dart';

class JumpCommand implements BaseCommand {
  void Function(String action) printer;

  JumpCommand(this.printer);

  @override
  void execute() {
    printer("Saltar");
  }

  @override
  void undo() {
    printer("Dessaltar");
  }
}
