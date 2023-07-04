import 'data.dart';

class Text extends Data {
  String value = "";

  Text([String? value]) {
    if (value != null) {
      this.value = value;
    }
  }

  @override
  bool get hasValue => value.trim().isNotEmpty;

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];

    return [Text(value)];
  }

  @override
  String toString() => value;
}
