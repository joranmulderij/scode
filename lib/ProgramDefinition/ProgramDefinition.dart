import '../ProgramDefinition/ProgramState.dart';
import 'ProgramLine/ProgramLine.dart';

class ProgramDefinition {
  List<ProgramLine> lines;

  ProgramDefinition(this.lines);

  void execute(ProgramState state) {
    for (ProgramLine line in lines) {
      line.execute(state);
    }
  }
}
