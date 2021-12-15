abstract class BaseCommand {
  void execute();
  void undo();
}

class NullCommand implements BaseCommand {
  static const NullCommand instance = NullCommand._();

  const NullCommand._();

  @override
  void execute() {
    print("No hago nada");
  }

  @override
  void undo() {
    print("No deshago nada");
  }
}
