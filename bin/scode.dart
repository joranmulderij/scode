import 'package:scode/scode.dart';

void main(List<String> arguments) {
  // run();
  DateTime start = DateTime.now();
  run();
  DateTime end = DateTime.now();
  print('Execution time: ${end.difference(start).inMilliseconds}ms');
}
