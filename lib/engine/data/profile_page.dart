// how to do whatsapp, imessage, etc

import 'data.dart';
import 'text.dart';

class ProfilePage extends Data {
  ProfilePage({required this.name, required this.uri, required this.addSlash});

  late final String name;
  late final String uri;
  late bool addSlash;
  final Text handle = Text();

  String get value {
    String url = '$uri$handle';
    if (addSlash && url.isNotEmpty && url[url.length - 1] != '/') {
      url = '$url/';
    }
    return url;
  }

  String get fullHandle {
    String url = '$handle';
    if (addSlash && url.isNotEmpty && url[url.length - 1] != '/') {
      url = '$url/';
    }
    return url;
  }

  @override
  bool get hasValue => handle.hasValue;

  @override
  bool get isValid => Uri.tryParse("$uri$handle") != null;

  @override
  List<Text> asRawData() {
    if (hasNotValue) return [];

    List<Text> data = [];
    if (name.isNotEmpty) {
      data.add(Text(name));
    }
    if (uri.isNotEmpty) {
      data.add(Text(fullHandle));
    }
    return data;
  }
}

final profilePages = [
  ProfilePage(
      name: 'Facebook', uri: 'https://www.facebook.com/', addSlash: false),
  ProfilePage(name: 'Twitter', uri: 'https://twitter.com/', addSlash: false),
  ProfilePage(
      name: 'LinkedIn', uri: 'https://www.linkedin.com/in/', addSlash: true),
  ProfilePage(
      name: 'Instagram', uri: 'https://www.instagram.com/', addSlash: true),
  ProfilePage(name: 'TikTok', uri: 'https://www.tiktok.com/@', addSlash: false),
];
