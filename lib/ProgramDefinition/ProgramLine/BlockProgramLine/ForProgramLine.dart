import 'package:scode/ProgramDefinition/Expression/VariableExpression.dart';
import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/BlockProgramLine.dart';

import '../../Expression/Expression.dart';
import '../../ProgramState.dart';
import '../../Values/IntValue.dart';

class ForProgramLine extends BlockProgramLine {
  ForProgramLine(this.loopVariable, this.max, this.min, this.step, super.indent)
      : super();
  final VariableExpression loopVariable;
  final Expression max;
  final Expression? min;
  final Expression? step;

  @override
  void execute(ProgramState state) {
    state.addScope();
    for (int i = getMin(state); i < getMax(state); i += getStep(state)) {
      state.setVariable(loopVariable.variable, IntValue(i));
      executeBlock(state);
    }
    state.removeScope();
  }

  int getMax(ProgramState state) {
    final maxVal = max.evaluate(state);
    assert(maxVal is IntValue);
    return (maxVal as IntValue).value;
  }

  int getMin(ProgramState state) {
    if (min == null) {
      return 0;
    }
    final minVal = min!.evaluate(state);
    assert(minVal is IntValue);
    return (minVal as IntValue).value;
  }

  int getStep(ProgramState state) {
    if (step == null) {
      return 1;
    }
    final stepVal = step!.evaluate(state);
    assert(stepVal is IntValue);
    return (stepVal as IntValue).value;
  }

  @override
  String toString() {
    return 'for ${loopVariable.variable} in range $min to $max by $step';
  }
}
