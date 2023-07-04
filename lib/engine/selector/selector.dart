import '../data/data.dart';
import '../data/text.dart';
import 'text.dart';
import 'address.dart';
import 'email.dart';
import 'name.dart';
import 'phone_number.dart';
import 'profile_page.dart';

abstract class Selector {
  const Selector();

  List<Text> select(Data data);
  bool isValidFor(Data data);
}

const kSelectors = [
  ...kTextSelectors,
  ...kAddressSelectors,
  ...kEmailSelectors,
  ...kNameSelectors,
  ...kPhoneNumberSelectors,
  ...kProfilePageSelectors,
];
