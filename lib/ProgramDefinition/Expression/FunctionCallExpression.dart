import '../ProgramState.dart';
import '../Values/Value.dart';
import 'Expression.dart';

class FunctionCallExpression<T extends Value> extends Expression {
  Expression function;
  List<Expression> positionalArguments;
  Map<String, Expression> namedArguments;

  FunctionCallExpression(
      this.function, this.positionalArguments, this.namedArguments);

  @override
  Value evaluate(ProgramState state) {
    final positionalArgumentValues = positionalArguments.map((argument) {
      final value = argument.evaluate(state);
      assert(value is Value<T>);
      return value as Value<T>;
    }).toList();
    final namedArgumentValues = namedArguments.map((name, argument) {
      final value = argument.evaluate(state);
      assert(value is Value<T>);
      return MapEntry(name, value as Value<T>);
    });
    final functionValue = function.evaluate(state);
    assert(functionValue is Value<T>);
    return functionValue.functionCall(
        positionalArgumentValues, namedArgumentValues);
  }
}
