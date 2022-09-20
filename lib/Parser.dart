import 'package:petitparser/petitparser.dart';
import 'package:scode/ProgramDefinition/Expression/Expression.dart';
import 'package:scode/ProgramDefinition/Expression/TwoParameterOperatorExpression/DivideOperatorExpression.dart';
import 'package:scode/ProgramDefinition/Expression/TwoParameterOperatorExpression/MinusOperatorExpression.dart';
import 'package:scode/ProgramDefinition/Expression/TwoParameterOperatorExpression/PlusOperatorExpression.dart';
import 'package:scode/ProgramDefinition/Expression/TwoParameterOperatorExpression/TimesOperatorExpression.dart';
import 'package:scode/ProgramDefinition/Expression/ValueExpression.dart';
import 'package:scode/ProgramDefinition/Expression/VariableExpression.dart';
import 'package:scode/ProgramDefinition/ProgramLine/ExpressionProgramLine.dart';
import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/IfProgramLine.dart';
import 'package:scode/ProgramDefinition/ProgramLine/BlockProgramLine/TempBlockProgramLine.dart';
import 'package:scode/ProgramDefinition/Values/IntValue.dart';
import 'package:scode/ProgramDefinition/Values/StringValue.dart';

import 'ProgramDefinition/ProgramLine/BlockProgramLine/ForProgramLine.dart';
import 'ProgramDefinition/ProgramLine/ProgramLine.dart';
import 'ProgramDefinition/Values/Value.dart';

class ScodeGrammarDefinition extends GrammarDefinition {
  @override
  Parser<List<ProgramLine>> start() => ref0(program).end();

  Parser<List<ProgramLine>> program() => ref0(line)
      .separatedBy(char('\n'))
      .map((value) => value.whereType<ProgramLine>().toList());

  Parser<ProgramLine> line() => ChoiceParser<ProgramLine>(
        [ref0(blockStarter), ref0(singleLine)],
      );

  // Parser emptyLine() => char(' ').star().t();

  Parser<ProgramLine> blockStarter() => ref0(ifLine);

  Parser<TempBlockProgramLine> ifLine() =>
      (ref0(indent) & string('if ') & ref0(expression)).map((value) =>
          TempBlockProgramLine(IfProgramLine(value[2], value[0]), value[0]));

  Parser<TempBlockProgramLine> forLine() => (ref0(indent) &
              string('for ') &
              ref0(variable) &
              string(' in ') &
              ref0(expression) &
              (string('..') &
                      ref0(expression) &
                      (char(':') & ref0(expression)).optional())
                  .optional())
          .map((value) {
        VariableExpression variable = value[2];
        Expression max;
        Expression min;
        Expression step;
        if (value.length == 6) {
          min = value[4];
          max = value[5][1];
          if (value[5].length == 3) {
            step = value[5][2][1];
          } else {
            step = ValueExpression(IntValue(1));
          }
        } else {
          min = ValueExpression(IntValue(0));
          max = value[4];
          step = ValueExpression(IntValue(1));
        }
        return TempBlockProgramLine(
            ForProgramLine(variable, max, min, step, value[0]), value[0]);
      });

  Parser<int> indent() => string('    ').star().map((value) => value.length);

  Parser<ProgramLine> singleLine() => (ref0(indent) & ref0(expression))
      .map((value) => ExpressionProgramLine(value[1], value[0]));

  Parser<Expression> expression() => ref0(level1);

  Parser<Expression> level1() =>
      ChoiceParser<Expression>([ref0(add), ref0(sub), ref0(level2)]);
  Parser<Expression> sub() => (ref0(level2) & char('-').t() & ref0(level1))
      .map((value) => PlusOperatorExpression(value[0], value[2]));
  Parser<Expression> add() => (ref0(level2) & char('+').t() & ref0(level1))
      .map((value) => MinusOperatorExpression(value[0], value[2]));

  Parser<Expression> level2() =>
      ChoiceParser<Expression>([ref0(mul), ref0(div), ref0(level3)]);
  Parser<Expression> mul() => (ref0(level3) & char('*').t() & ref0(level2))
      .map((value) => TimesOperatorExpression(value[0], value[2]));
  Parser<Expression> div() => (ref0(level3) & char('/').t() & ref0(level2))
      .map((value) => DivideOperatorExpression(value[0], value[2]));

  Parser<Expression> level3() =>
      ChoiceParser<Expression>([ref0(parens), ref0(singleExpression)]);
  Parser<Expression> parens() =>
      (char('(').t() & ref0(level1) & char(')').t()).map((value) => value[1]);

  Parser<Expression> singleExpression() =>
      ChoiceParser<Expression>([variable(), value()]);

  Parser<VariableExpression> variable() =>
      letter().plus().flatten().map((value) => VariableExpression(value));

  Parser<ValueExpression> value() =>
      ChoiceParser<Value>([number(), stringValue()])
          .map((value) => ValueExpression(value));

  Parser<IntValue> number() =>
      digit().plus().flatten().t().map((value) => IntValue(int.parse(value)));

  Parser<StringValue> stringValue() =>
      (char('"').t() & (char('"').neg().plus()).flatten() & char('"').t())
          .map((value) => StringValue(value[1]));
}

extension TrimmingNotNewlineParserExtension<T> on Parser<T> {
  Parser<T> t() => TrimmingParser<T>(this, anyOf(' \t'), anyOf(' \t'));
}
