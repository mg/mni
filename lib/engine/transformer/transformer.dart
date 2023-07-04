import '../data/text.dart';

abstract class Transformer {
  const Transformer();

  Text transform(Text data);
}

enum Input {
  data,
  text,
  name,
  email,
  phoneNumber,
  address,
  website,
  profilePage,
}

enum Output {
  text,
  listOfText,
}
