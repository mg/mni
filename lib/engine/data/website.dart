import 'data.dart';
import 'text.dart';

class Website extends Data {
  final Text uri = Text();
  final Text title = Text();

  @override
  bool get hasValue => uri.hasValue;

  @override
  bool get isValid => Uri.tryParse(uri.value) != null;

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];

    List<Text> data = [];
    if (title.hasValue) {
      data.add(title);
    }
    if (uri.hasValue) {
      data.add(uri);
    }
    return data;
  }
}
