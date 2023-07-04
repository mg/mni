import 'selector.dart';
import '../data/data.dart';
import '../data/text.dart';
import '../data/name.dart';

abstract class SelectFromName extends Selector {
  const SelectFromName();

  @override
  List<Text> select(Data data) {
    if (data is Name) {
      return selectFromName(data);
    }
    return [];
  }

  List<Text> selectFromName(Name name);

  @override
  bool isValidFor(Data data) {
    if (data is Name) {
      return isValidForName(data);
    }
    return false;
  }

  bool isValidForName(Name name);
}

class NameToFirstName extends SelectFromName {
  const NameToFirstName();

  @override
  List<Text> selectFromName(Name name) => [name.firstName];

  @override
  bool isValidForName(Name name) {
    return name.firstName.isValid;
  }
}

class NameToSurName extends SelectFromName {
  const NameToSurName();

  @override
  List<Text> selectFromName(Name name) {
    if (name.familyName.hasValue) return [name.familyName];
    return [name.patronymicName];
  }

  @override
  bool isValidForName(Name name) {
    return name.familyName.isValid || name.patronymicName.isValid;
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

class NameToTitledSurName extends SelectFromName {
  const NameToTitledSurName();

  @override
  List<Text> selectFromName(Name name) {
    final surname = name.familyName.hasValue
        ? name.familyName.value
        : name.patronymicName.value;
    return [Text("${_titleToString(name.title)}$surname")];
  }

  @override
  bool isValidForName(Name name) {
    return name.title != NameTitle.none &&
        (name.familyName.isValid || name.patronymicName.isValid);
  }
}

class NameToTitledFirstName extends SelectFromName {
  const NameToTitledFirstName();

  @override
  List<Text> selectFromName(Name name) {
    return [Text("${_titleToString(name.title)}${name.firstName}")];
  }

  @override
  bool isValidForName(Name name) {
    return name.title != NameTitle.none && name.firstName.isValid;
  }
}

class NameToFullName extends SelectFromName {
  const NameToFullName();

  @override
  List<Text> selectFromName(Name name) {
    String fullName = name.firstName.value;

    for (final middleName in name.middleNames) {
      if (middleName.hasValue) {
        fullName = "$fullName ${middleName.value}";
      }
    }

    if (name.patronymicName.hasValue) {
      fullName = "$fullName ${name.patronymicName.value}";
    }
    if (name.familyName.hasValue) {
      fullName = "$fullName ${name.familyName.value}";
    }
    return [Text(fullName)];
  }

  @override
  bool isValidForName(Name name) {
    return name.firstName.isValid &&
        (name.patronymicName.isValid || name.familyName.isValid);
  }
}

const kNameSelectors = [
  NameToFirstName(),
  NameToSurName(),
  NameToTitledSurName(),
  NameToTitledFirstName(),
  NameToFullName(),
];
