import 'package:scode/typedef.dart';

import 'ProgramDefinition/ProgramDefinition.dart';
import 'ProgramDefinition/ProgramState.dart';

class ProgramEnvironment {
  ProgramDefinition program;
  ProgramState state = ProgramState();

  ProgramEnvironment(this.program, Map<String, ScodeFunction> functions) {
    state.addDartFunctions(functions);
  }

  void execute() {
    program.execute(state);
  }
}
