import '../../Values/Value.dart';
import '../Expression.dart';
import 'TwoParameterOperatorExpression.dart';

class PlusOperatorExpression<T extends Value>
    extends TwoParameterOperatorExpression<T> {
  PlusOperatorExpression(Expression left, Expression right)
      : super(left, right);

  @override
  T evaluateOperator(Value<T> left, T right) {
    return left.plus(right);
  }

  @override
  String toString() {
    return '$left + $right';
  }
}
