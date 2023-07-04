import 'data.dart';
import 'text.dart';

class Address extends Data {
  final Text streetAddress = Text();
  final Text apartment = Text();
  final Text postCode = Text();
  final Text city = Text();
  final Text state = Text();
  final Text country = Text();

  @override
  bool get isValid {
    return streetAddress.hasValue &&
        postCode.hasValue &&
        city.hasValue &&
        country.hasValue;
  }

  @override
  bool get hasValue {
    if (streetAddress.hasValue) return true;
    if (apartment.hasValue) return true;
    if (postCode.hasValue) return true;
    if (city.hasValue) return true;
    if (state.hasValue) return true;
    if (country.hasValue) return true;
    return false;
  }

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];

    List<Text> data = [];
    if (streetAddress.hasValue) data.add(streetAddress);
    if (apartment.hasValue) data.add(apartment);
    if (postCode.hasValue) data.add(postCode);
    if (city.hasValue) data.add(city);
    if (state.hasValue) data.add(state);
    if (country.hasValue) data.add(country);
    return data;
  }
}
