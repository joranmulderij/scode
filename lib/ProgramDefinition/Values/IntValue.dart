import 'Value.dart';

class IntValue extends Value<IntValue> {
  int value;

  IntValue(this.value);

  @override
  String toString() {
    return value.toString();
  }

  @override
  IntValue divide(IntValue other) {
    return IntValue(value ~/ other.value);
  }

  @override
  IntValue minus(IntValue other) {
    return IntValue(value - other.value);
  }

  @override
  IntValue modulo(IntValue other) {
    return IntValue(value % other.value);
  }

  @override
  IntValue plus(IntValue other) {
    return IntValue(value + other.value);
  }

  @override
  IntValue times(IntValue other) {
    return IntValue(value * other.value);
  }

  @override
  bool equals(IntValue other) {
    return value == other.value;
  }
}
