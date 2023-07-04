import '../data/data.dart';
import '../data/text.dart';
import '../data/phone_number.dart';
import 'selector.dart';

abstract class SelectFromPhoneNumber extends Selector {
  const SelectFromPhoneNumber();

  @override
  List<Text> select(Data data) {
    if (data is PhoneNumber) {
      return selectFromPhoneNumber(data);
    }
    return [];
  }

  List<Text> selectFromPhoneNumber(PhoneNumber phoneNumber);

  @override
  bool isValidFor(Data data) {
    if (data is PhoneNumber) {
      return isValidForPhoneNumber(data);
    }
    return false;
  }

  bool isValidForPhoneNumber(PhoneNumber phoneNumber);
}

class ToLocalPhoneNumber extends SelectFromPhoneNumber {
  const ToLocalPhoneNumber();

  @override
  List<Text> selectFromPhoneNumber(PhoneNumber phoneNumber) {
    return [Text(phoneNumber.phoneNumber.value)];
  }

  @override
  bool isValidForPhoneNumber(PhoneNumber phoneNumber) {
    return phoneNumber.isValid;
  }
}

class ToInternationalPhoneNumber extends SelectFromPhoneNumber {
  const ToInternationalPhoneNumber();

  @override
  List<Text> selectFromPhoneNumber(PhoneNumber phoneNumber) {
    return [Text('+${phoneNumber.countryCode} ${phoneNumber.phoneNumber}')];
  }

  @override
  bool isValidForPhoneNumber(PhoneNumber phoneNumber) {
    return phoneNumber.isValid && phoneNumber.countryCode.isValid;
  }
}

const kPhoneNumberSelectors = [
  ToLocalPhoneNumber(),
  ToInternationalPhoneNumber(),
];
