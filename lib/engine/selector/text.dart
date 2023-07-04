import '../data/data.dart';
import '../data/text.dart';
import 'selector.dart';

class SelectFromText extends Selector {
  const SelectFromText();

  @override
  List<Text> select(Data data) {
    if (data is Text) {
      return [data];
    }
    return [];
  }

  @override
  bool isValidFor(Data data) {
    if (data is Text) {
      return true;
    }
    return false;
  }
}

const kTextSelectors = [
  SelectFromText(),
];
