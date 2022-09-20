import 'package:scode/typedef.dart';

import 'Scope.dart';
import 'Values/DartFunctionValue.dart';
import 'Values/Value.dart';

class ProgramState {
  List<Scope> scopes = [Scope()];
  bool globalScope = false;

  ProgramState();

  void setVariable(String variable, Value value) {
    for (var i = scopes.length - 1; i >= 0; i--) {
      var scope = scopes[i];
      if (scope.variables.containsKey(variable)) {
        scope.variables[variable] = value;
        return;
      }
    }
    scopes.last.variables[variable] = value;
  }

  Value? getVariable(String variable) {
    for (var i = scopes.length - 1; i >= 0; i--) {
      var scope = scopes[i];
      if (scope.variables.containsKey(variable)) {
        return scope.variables[variable];
      }
    }
    throw Exception('Variable $variable not found');
  }

  void addScope() {
    scopes.add(Scope());
  }

  void removeScope() {
    scopes.removeLast();
  }

  void addDartFunctions(Map<String, ScodeFunction> functions) {
    for (var entry in functions.entries) {
      setVariable(entry.key, DartFunctionValue(entry.value));
    }
  }
}
