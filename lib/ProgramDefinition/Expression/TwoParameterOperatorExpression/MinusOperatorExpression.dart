import '../../Values/Value.dart';
import '../Expression.dart';
import 'TwoParameterOperatorExpression.dart';

class MinusOperatorExpression<T extends Value>
    extends TwoParameterOperatorExpression<T> {
  MinusOperatorExpression(Expression left, Expression right)
      : super(left, right);

  @override
  T evaluateOperator(Value<T> left, T right) {
    return left.minus(right);
  }

  @override
  String toString() {
    return '$left - $right';
  }
}
