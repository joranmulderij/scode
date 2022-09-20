import '../Expression/Expression.dart';
import 'ProgramLine.dart';
import '../ProgramState.dart';

class ExpressionProgramLine extends ProgramLine {
  ExpressionProgramLine(this.expression, super.indent) : super();
  final Expression expression;

  @override
  void execute(ProgramState state) {
    expression.evaluate(state);
  }

  @override
  String toString() {
    return 'ExpressionProgramLine($expression)';
  }
}
