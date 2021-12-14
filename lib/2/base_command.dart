abstract class BaseCommand {
  void execute();
}

class NullCommand implements BaseCommand {
  static const NullCommand instance = NullCommand._();

  const NullCommand._();

  @override
  void execute() {
    print("No hago nada");
  }
}
