import 'data.dart';
import 'text.dart';

enum NameTitle {
  none,
  mr,
  mrs,
  miss,
  prof,
  dr,
}

class Name extends Data {
  final Text firstName = Text();
  final Text familyName = Text();
  final Text patronymicName = Text();
  final List<Text> middleNames = [];

  NameTitle title = NameTitle.none;

  @override
  bool get isValid {
    return firstName.hasValue &&
        (familyName.hasValue || patronymicName.hasValue);
  }

  @override
  bool get hasValue {
    if (firstName.hasValue) return true;
    if (familyName.hasValue) return true;
    for (final middleName in middleNames) {
      if (middleName.hasValue) return true;
    }
    return false;
  }

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];

    String data = '';
    if (title != NameTitle.none) {
      data = '${_titleToString(title)} ';
    }
    if (firstName.hasValue) {
      data += '$firstName ';
    }
    for (final middleName in middleNames) {
      if (middleName.hasValue) {
        data += '$middleName ';
      }
    }
    if (patronymicName.hasValue) {
      data += '$patronymicName ';
    }
    if (familyName.hasValue) {
      data += '$familyName ';
    }

    return [Text(data.trimRight())];
  }
}

String _titleToString(NameTitle title) {
  switch (title) {
    case NameTitle.mr:
      return "Mr. ";
    case NameTitle.mrs:
      return "Mrs. ";
    case NameTitle.miss:
      return "Miss ";
    case NameTitle.prof:
      return "Prof. ";
    case NameTitle.dr:
      return "Dr. ";
    case NameTitle.none:
      return "";
  }
}
