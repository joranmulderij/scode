import 'Value.dart';

class MapValue extends Value<MapValue> {
  Map<Value, Value> value;

  MapValue(this.value);

  @override
  String toString() {
    return value.toString();
  }

  @override
  bool equals(MapValue other) {
    return value == other.value;
  }
}
