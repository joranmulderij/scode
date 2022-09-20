import '../ProgramState.dart';
import '../Values/Value.dart';

abstract class Expression {
  Expression();

  Value evaluate(ProgramState state);
}
