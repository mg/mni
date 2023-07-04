import '../data/data.dart';
import '../data/text.dart';
import '../data/email.dart';
import 'selector.dart';

abstract class SelectFromEmail extends Selector {
  const SelectFromEmail();

  @override
  List<Text> select(Data data) {
    if (data is Email) {
      return selectFromEmail(data);
    }
    return [];
  }

  List<Text> selectFromEmail(Email email);

  @override
  bool isValidFor(Data data) {
    if (data is Email) {
      return isValidForEmail(data);
    }
    return false;
  }

  bool isValidForEmail(Email email);
}

class EmailToFQE extends SelectFromEmail {
  const EmailToFQE();

  @override
  List<Text> selectFromEmail(Email email) {
    return [Text("${email.username.value}@${email.domain.value}")];
  }

  @override
  bool isValidForEmail(Email email) {
    return email.username.isValid && email.domain.isValid;
  }
}

const kEmailSelectors = [
  EmailToFQE(),
];
