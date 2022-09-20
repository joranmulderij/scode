import '../ProgramState.dart';
import '../Values/Value.dart';
import 'Expression.dart';

class VariableExpression<T extends Value> extends Expression {
  String variable;

  VariableExpression(this.variable);

  @override
  T evaluate(ProgramState state) {
    final temp = state.getVariable(variable);
    assert(temp is T);
    return temp as T;
  }
}
