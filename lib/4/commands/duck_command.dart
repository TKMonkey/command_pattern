import 'package:command_pattern/4/base_command.dart';

class DuckCommand implements BaseCommand {
  void Function(String action) printer;

  DuckCommand(this.printer);

  @override
  void execute() {
    printer("Agacharse");
  }
}
