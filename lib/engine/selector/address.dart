import '../data/data.dart';
import '../data/text.dart';
import '../data/address.dart';
import 'selector.dart';

abstract class SelectFromAddress extends Selector {
  const SelectFromAddress();

  @override
  List<Text> select(Data data) {
    if (data is Address) {
      return selectFromAddress(data);
    }
    return [];
  }

  List<Text> selectFromAddress(Address address);

  @override
  bool isValidFor(Data data) {
    if (data is Address) {
      return isValidForAddress(data);
    }
    return false;
  }

  bool isValidForAddress(Address address);
}

final class AddressToStreet extends SelectFromAddress {
  const AddressToStreet();

  @override
  List<Text> selectFromAddress(Address address) {
    List<Text> streetAddress = [];
    if (address.streetAddress.hasValue) {
      streetAddress.add(address.streetAddress);
    }
    if (address.apartment.hasValue) {
      streetAddress.add(address.apartment);
    }
    return streetAddress;
  }

  @override
  bool isValidForAddress(Address address) {
    return address.streetAddress.isValid || address.apartment.isValid;
  }
}

class AddressToStateCountry extends SelectFromAddress {
  const AddressToStateCountry();

  @override
  List<Text> selectFromAddress(Address address) {
    String stateCountry = "";
    if (address.state.hasValue) {
      stateCountry = address.state.value;
    }
    if (address.country.hasValue) {
      if (stateCountry.isNotEmpty) {
        stateCountry += " ";
      }
      stateCountry = address.country.value;
    }
    return [Text(stateCountry)];
  }

  @override
  bool isValidForAddress(Address address) {
    return address.state.isValid || address.country.isValid;
  }
}

class AddressToFullAddress extends SelectFromAddress {
  const AddressToFullAddress();

  @override
  List<Text> selectFromAddress(Address address) {
    List<Text> fullAddress = [];
    if (address.streetAddress.hasValue) {
      fullAddress.add(address.streetAddress);
    }
    if (address.apartment.hasValue) {
      fullAddress.add(address.apartment);
    }
    String cityState = "";
    if (address.city.hasValue) {
      cityState = address.city.value;
    }
    if (address.state.hasValue) {
      if (cityState.isNotEmpty) {
        cityState = "$cityState, ";
      }
      cityState = "$cityState${address.state.value}";
    }
    if (address.postCode.hasValue) {
      if (cityState.isNotEmpty) {
        if (address.state.hasValue) {
          cityState = "$cityState ";
        } else {
          cityState = "$cityState, ";
        }
      }
      cityState = "$cityState${address.postCode.value}";
    }
    if (cityState.isNotEmpty) {
      fullAddress.add(Text(cityState));
    }
    if (address.country.hasValue) {
      fullAddress.add(address.country);
    }

    return fullAddress;
  }

  @override
  bool isValidForAddress(Address address) {
    return address.isValid;
  }
}

const kAddressSelectors = [
  AddressToStreet(),
  AddressToStateCountry(),
  AddressToFullAddress(),
];
