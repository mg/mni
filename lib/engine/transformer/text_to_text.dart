import "package:characters/characters.dart";
import 'transformer.dart';
import '../data/text.dart';

class TextToUpperCase extends Transformer {
  const TextToUpperCase();

  @override
  Text transform(Text data) => Text(data.value.toUpperCase());
}

class TextToLowerCase extends Transformer {
  const TextToLowerCase();

  @override
  Text transform(Text data) => Text(data.value.toLowerCase());
}

class TextToASCII extends Transformer {
  const TextToASCII();

  @override
  Text transform(Text data) {
    String newValue = "";
    var iterator = Characters(data.value).iterator;
    while (iterator.moveNext()) {
      final char = iterator.current;
      if ("àáâãä".contains(char)) {
        newValue += "a";
      } else if ("ÀÁÂÃÄ".contains(char)) {
        newValue += "A";
      } else if ("ç".contains(char)) {
        newValue += "c";
      } else if ("Ç".contains(char)) {
        newValue += "C";
      } else if ("èéêë".contains(char)) {
        newValue += "e";
      } else if ("ÈÉÊË".contains(char)) {
        newValue += "E";
      } else if ("ìíîï".contains(char)) {
        newValue += "i";
      } else if ("ÌÍÎÏ".contains(char)) {
        newValue += "I";
      } else if ("ñ".contains(char)) {
        newValue += "n";
      } else if ("Ñ".contains(char)) {
        newValue += "N";
      } else if ("òóôõö".contains(char)) {
        newValue += "o";
      } else if ("ÒÓÔÕÖ".contains(char)) {
        newValue += "O";
      } else if ("š".contains(char)) {
        newValue += "s";
      } else if ("Š".contains(char)) {
        newValue += "s";
      } else if ("ß".contains(char)) {
        newValue += "ss";
      } else if ("úùûü".contains(char)) {
        newValue += "u";
      } else if ("ÚÙÛÜ".contains(char)) {
        newValue += "U";
      } else if ("ýÿ".contains(char)) {
        newValue += "y";
      } else if ("ÝŸ".contains(char)) {
        newValue += "Y";
      } else if ("ž".contains(char)) {
        newValue += "z";
      } else if ("Ž".contains(char)) {
        newValue += "Z";
      } else if ("þ".contains(char)) {
        newValue += "th";
      } else if ("Þ".contains(char)) {
        newValue += "Th";
      } else if ("ð".contains(char)) {
        newValue += "d";
      } else if ("Ð".contains(char)) {
        newValue += "D";
      } else if ("æ".contains(char)) {
        newValue += "ae";
      } else if ("Æ".contains(char)) {
        newValue += "Ae";
      } else {
        newValue += char;
      }
    }
    return Text(newValue);
  }
}

const kTransformers = [
  TextToLowerCase(),
  TextToUpperCase(),
  TextToASCII(),
];
