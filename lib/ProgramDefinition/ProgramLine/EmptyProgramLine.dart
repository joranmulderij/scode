import '../Expression/Expression.dart';
import 'ProgramLine.dart';
import '../ProgramState.dart';

class EmptyProgramLine extends ProgramLine {
  EmptyProgramLine() : super(0);

  @override
  void execute(ProgramState state) {}

  @override
  String toString() {
    return 'EmptyProgramLine';
  }
}
