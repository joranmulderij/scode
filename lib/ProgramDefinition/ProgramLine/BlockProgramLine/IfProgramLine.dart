import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/BlockProgramLine.dart';
import 'package:scode/ProgramDefinition/Values/BoolValue.dart';

import '../../Expression/Expression.dart';
import '../../ProgramState.dart';

class IfProgramLine extends BlockProgramLine {
  IfProgramLine(this.condition, super.indent) : super();
  final Expression condition;

  @override
  void execute(ProgramState state) {
    state.addScope();
    final conditionValue = condition.evaluate(state);
    assert(conditionValue is BoolValue);
    if ((conditionValue as BoolValue).value) {
      executeBlock(state);
    }
    state.removeScope();
  }

  @override
  String toString() {
    return 'if $condition';
  }
}
