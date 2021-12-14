import 'package:command_pattern/2/base_command.dart';

class JumpCommand implements BaseCommand {
  void Function(String action) printer;

  JumpCommand(this.printer);

  @override
  void execute() {
    printer("Saltar");
  }
}
