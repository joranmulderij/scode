import '../../Values/Value.dart';
import '../Expression.dart';
import 'TwoParameterOperatorExpression.dart';

class TimesOperatorExpression<T extends Value>
    extends TwoParameterOperatorExpression<T> {
  TimesOperatorExpression(Expression left, Expression right)
      : super(left, right);

  @override
  T evaluateOperator(Value<T> left, T right) {
    return left.times(right);
  }

  @override
  String toString() {
    return '$left * $right';
  }
}
