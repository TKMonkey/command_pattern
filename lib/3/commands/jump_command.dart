import 'package:command_pattern/3/base_actor.dart';
import 'package:command_pattern/3/base_command.dart';

class JumpCommand implements BaseCommand {
  void Function(String action) printer;

  JumpCommand(this.printer);

  @override
  void execute(BaseActor actor) {
    printer("${actor.name}:\nSaltar");
  }
}
