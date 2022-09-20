import 'package:petitparser/context.dart';
import 'package:petitparser/parser.dart';
import 'package:scode/Parser.dart';
import 'package:scode/ProgramDefinition/Expression/Expression.dart';
import 'package:scode/ProgramDefinition/Expression/OneParameterOperatorExpression/FunctionCallExpression.dart';
import 'package:scode/ProgramDefinition/Expression/VariableExpression.dart';
import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/BlockProgramLine.dart';
import 'package:scode/ProgramDefinition/ProgramLine/ProgramLine.dart';
import 'package:scode/ProgramDefinition/Values/IntValue.dart';

import 'ProgramDefinition/ProgramLine/AssignProgramLine.dart';
import 'ProgramDefinition/ProgramDefinition.dart';
import 'ProgramDefinition/ProgramLine/BlockProgramLine/TempBlockProgramLine.dart';
import 'ProgramDefinition/Values/Value.dart';
import 'ProgramEnvironment.dart';

void run() {
  ScodeGrammarDefinition grammarDefinition = ScodeGrammarDefinition();
  Parser parser = grammarDefinition.build();
//   Result result = parser.parse('''
// 2+2
// if 2+2
//     2+2
//     2+2''');
  Result result = parser.parse('for i in 0..10:2');
  if (result.isSuccess) {
    List<ProgramLine> programLines = result.value;
    List<ProgramLine> newProgramLines = [];
    List<BlockProgramLine> programLineMap = [];
    for (var programLine in programLines) {
      programLineMap = programLineMap.sublist(0, programLine.indent);
      if (programLine.indent == 0) {
        if (programLine is TempBlockProgramLine) {
          newProgramLines.add(programLine.line);
          programLineMap.add(programLine.line);
        } else {
          newProgramLines.add(programLine);
        }
      } else {
        if (programLine is TempBlockProgramLine) {
          programLineMap[programLine.indent - 1].block.add(programLine.line);
          programLineMap.add(programLine.line);
        } else {
          programLineMap[programLine.indent - 1].block.add(programLine);
        }
      }
    }
    print(newProgramLines);
  } else {
    print(result.message);
    print(result.position);
  }

  // ProgramEnvironment environment = ProgramEnvironment(
  //   ProgramDefinition([
  //     AssignProgramLine(
  //         'test', FunctionCallExpression(VariableExpression('print'))),
  //   ]),
  //   {
  //     'print':
  //         (List<Value> positionalArguments, Map<String, Value> namedArguments) {
  //       // print('test called!');
  //       return IntValue(0);
  //     }
  //   },
  // );
  // environment.execute();
}
