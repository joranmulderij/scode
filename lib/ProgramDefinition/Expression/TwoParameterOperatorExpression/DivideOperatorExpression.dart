import '../../Values/Value.dart';
import '../Expression.dart';
import 'TwoParameterOperatorExpression.dart';

class DivideOperatorExpression<T extends Value>
    extends TwoParameterOperatorExpression<T> {
  DivideOperatorExpression(Expression left, Expression right)
      : super(left, right);

  @override
  T evaluateOperator(Value<T> left, T right) {
    return left.divide(right);
  }

  @override
  String toString() {
    return '$left / $right';
  }
}
