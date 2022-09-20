import 'Value.dart';

class StringValue extends Value<StringValue> {
  String value;

  StringValue(this.value);

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool equals(StringValue other) {
    return value == other.value;
  }
}
