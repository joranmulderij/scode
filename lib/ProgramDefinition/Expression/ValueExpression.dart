import '../ProgramState.dart';
import '../Values/Value.dart';
import 'Expression.dart';

class ValueExpression<T extends Value> extends Expression {
  T value;

  ValueExpression(this.value);

  @override
  T evaluate(ProgramState state) {
    return value;
  }
}
