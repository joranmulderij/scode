import 'package:scode/typedef.dart';

import 'Value.dart';

class DartFunctionValue extends Value<DartFunctionValue> {
  ScodeFunction function;

  DartFunctionValue(this.function);

  @override
  String toString() {
    return function.toString();
  }

  // @override
  // DartFunctionValue plus(DartFunctionValue other) {
  //   return DartFunctionValue(
  //       (List<Value> positionalArguments, List<Value> namedArguments) {
  //     function(positionalArguments, namedArguments);
  //     other.function(positionalArguments, namedArguments);
  //   });
  // }

  @override
  Value functionCall(
      List<Value> parameters, Map<String, Value> namedParameters) {
    return function(parameters, namedParameters);
  }

  @override
  bool equals(DartFunctionValue other) {
    return function == other.function;
  }
}
