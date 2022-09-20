import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/BlockProgramLine.dart';
import 'package:scode/ProgramDefinition/ProgramLine/ProgramLine.dart';
import 'package:scode/ProgramDefinition/ProgramState.dart';

class TempBlockProgramLine extends ProgramLine {
  BlockProgramLine line;

  TempBlockProgramLine(this.line, super.indent);

  @override
  void execute(ProgramState state) {
    throw UnimplementedError();
  }
}
