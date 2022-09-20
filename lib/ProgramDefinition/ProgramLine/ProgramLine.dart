import '../ProgramState.dart';

abstract class ProgramLine {
  final int indent;

  ProgramLine(this.indent);

  void execute(ProgramState state);
}
