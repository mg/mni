import 'data.dart';
import 'text.dart';

final RegExp _phoneNumberValidator = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');

class PhoneNumber extends Data {
  final Text countryCode = Text();
  final Text phoneNumber = Text();

  @override
  bool get hasValue => phoneNumber.hasValue;

  @override
  bool get isValid {
    if (countryCode.hasValue && phoneNumber.hasValue) {
      return _phoneNumberValidator.hasMatch("+$countryCode $phoneNumber");
    } else if (phoneNumber.hasValue) {
      return _phoneNumberValidator.hasMatch(phoneNumber.value);
    }
    return false;
  }

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];
    String data = '';
    if (countryCode.hasValue) {
      data = '+$countryCode ';
    }
    data += '$phoneNumber';
    return [Text(data)];
  }
}
