import 'ProgramDefinition/Values/Value.dart';

typedef ScodeFunction = Value Function(
    List<Value> positionalArguments, Map<String, Value> namedArguments);
