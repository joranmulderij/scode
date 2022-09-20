abstract class Value<T extends Object> {
  @override
  String toString();

  T minus(T other) {
    throw UnimplementedError();
  }

  T plus(T other) {
    throw UnimplementedError();
  }

  T times(T other) {
    throw UnimplementedError();
  }

  T divide(T other) {
    throw UnimplementedError();
  }

  T modulo(T other) {
    throw UnimplementedError();
  }

  bool equals(T other) {
    throw UnimplementedError();
  }

  Value functionCall(
      List<Value> parameters, Map<String, Value> namedParameters) {
    throw UnimplementedError();
  }
}
