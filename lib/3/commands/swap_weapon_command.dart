import 'package:command_pattern/3/base_actor.dart';
import 'package:command_pattern/3/base_command.dart';

class SwapWeaponCommand implements BaseCommand {
  void Function(String action) printer;

  SwapWeaponCommand(this.printer);

  @override
  void execute(BaseActor actor) {
    printer("${actor.name}:\nCambiar Arma");
  }
}
