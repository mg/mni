import 'text.dart';

abstract class Data {
  bool get isValid => hasValue;
  bool get hasValue;
  bool get hasNotValue => !hasValue;

  List<Text> asRawData();
}
