import 'package:command_pattern/5/base_command.dart';

class SwapWeaponCommand implements BaseCommand {
  void Function(String action) printer;

  SwapWeaponCommand(this.printer);

  @override
  void execute() {
    printer("Cambiar Arma");
  }

  @override
  void undo() {
    printer("Descambiar Arma");
  }
}
