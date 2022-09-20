import '../../Values/Value.dart';
import '../Expression.dart';
import 'OneParameterOperatorExpression.dart';

class FunctionCallExpression<T extends Value>
    extends OneParameterOperatorExpression<T> {
  FunctionCallExpression(Expression ex) : super(ex);

  @override
  Value evaluateOperator(Value<T> ex) {
    return ex.functionCall([], {});
  }

  @override
  String toString() {
    return '$ex()';
  }
}
