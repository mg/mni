import 'package:email_validator/email_validator.dart';
import 'data.dart';
import 'text.dart';

class Email extends Data {
  final Text username = Text();
  final Text domain = Text();

  @override
  bool get hasValue => username.hasValue && domain.hasValue;

  @override
  bool get isValid => EmailValidator.validate('$username@$domain');

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];
    return [Text('$username@$domain')];
  }
}
