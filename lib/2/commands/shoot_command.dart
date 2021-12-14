import 'package:command_pattern/2/base_command.dart';

class ShootCommand implements BaseCommand {
  void Function(String action) printer;

  ShootCommand(this.printer);

  @override
  void execute() {
    printer("Disparar");
  }
}
