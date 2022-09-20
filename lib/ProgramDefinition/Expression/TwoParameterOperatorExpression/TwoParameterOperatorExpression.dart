import '../../ProgramState.dart';
import '../../Values/Value.dart';
import '../Expression.dart';

abstract class TwoParameterOperatorExpression<T extends Value>
    extends Expression {
  Expression left;
  Expression right;

  TwoParameterOperatorExpression(this.left, this.right);

  T evaluateOperator(Value<T> left, T right);

  @override
  T evaluate(ProgramState state) {
    final leftValue = left.evaluate(state);
    final rightValue = right.evaluate(state);
    assert(leftValue is Value<T>);
    assert(rightValue is T);
    return evaluateOperator(leftValue as Value<T>, rightValue as T);
  }
}
