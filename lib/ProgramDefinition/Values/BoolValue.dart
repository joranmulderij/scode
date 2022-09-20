import 'Value.dart';

class BoolValue extends Value<BoolValue> {
  bool value;

  BoolValue(this.value);

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool equals(BoolValue other) {
    return value == other.value;
  }
}
