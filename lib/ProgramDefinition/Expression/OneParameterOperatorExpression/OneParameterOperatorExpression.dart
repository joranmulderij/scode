import '../../ProgramState.dart';
import '../../Values/Value.dart';
import '../Expression.dart';

abstract class OneParameterOperatorExpression<T extends Value>
    extends Expression {
  Expression ex;

  OneParameterOperatorExpression(this.ex);

  Value evaluateOperator(Value<T> ex);

  @override
  Value evaluate(ProgramState state) {
    final exValue = ex.evaluate(state);
    assert(exValue is Value<T>);
    return evaluateOperator(exValue as Value<T>);
  }
}
