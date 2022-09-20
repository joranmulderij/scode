import '../Expression/Expression.dart';
import 'ProgramLine.dart';
import '../ProgramState.dart';

class AssignProgramLine extends ProgramLine {
  AssignProgramLine(this.variable, this.expression, super.indent) : super();

  final String variable;
  final Expression expression;

  @override
  void execute(ProgramState state) {
    state.setVariable(variable, expression.evaluate(state));
  }

  @override
  String toString() {
    return '$variable = $expression';
  }
}
