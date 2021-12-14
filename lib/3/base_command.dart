import 'package:command_pattern/3/base_actor.dart';

abstract class BaseCommand {
  void execute(BaseActor actor);
}

class NullCommand implements BaseCommand {
  static const NullCommand instance = NullCommand._();

  const NullCommand._();

  @override
  void execute(BaseActor actor) {
    print("No hago nada");
  }
}
