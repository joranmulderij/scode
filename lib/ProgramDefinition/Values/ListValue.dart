import 'Value.dart';

class ListValue extends Value<ListValue> {
  List<Value> value;

  ListValue(this.value);

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool equals(ListValue other) {
    return value == other.value;
  }
}
