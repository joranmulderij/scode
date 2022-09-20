import 'package:scode/ProgramDefinition/ProgramState.dart';

import '../ProgramLine.dart';

abstract class BlockProgramLine extends ProgramLine {
  final List<ProgramLine> block = [];
  BlockProgramLine(super.indent) : super();

  @override
  void execute(ProgramState state) {
    throw UnimplementedError();
  }

  void executeBlock(ProgramState state) {
    for (final line in block) {
      line.execute(state);
    }
  }
}
