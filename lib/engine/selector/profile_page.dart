import '../data/data.dart';
import '../data/text.dart';
import '../data/profile_page.dart';
import 'selector.dart';

abstract class SelectFromProfilePage extends Selector {
  const SelectFromProfilePage();

  @override
  List<Text> select(Data data) {
    if (data is ProfilePage) {
      return selectFromProfilePage(data);
    }
    return [];
  }

  List<Text> selectFromProfilePage(ProfilePage profilePage);

  @override
  bool isValidFor(Data data) {
    if (data is ProfilePage) {
      return isValidForProfilePage(data);
    }
    return false;
  }

  bool isValidForProfilePage(ProfilePage profilePage);
}

class ProfilePageToUrl extends SelectFromProfilePage {
  const ProfilePageToUrl();

  @override
  List<Text> selectFromProfilePage(ProfilePage profilePage) {
    return [Text(profilePage.value)];
  }

  @override
  bool isValidForProfilePage(ProfilePage profilePage) {
    return profilePage.isValid;
  }
}

class ProfilePageToHandle extends SelectFromProfilePage {
  const ProfilePageToHandle();

  @override
  List<Text> selectFromProfilePage(ProfilePage profilePage) {
    return [Text(profilePage.fullHandle)];
  }

  @override
  bool isValidForProfilePage(ProfilePage profilePage) {
    return profilePage.handle.isValid;
  }
}

const kProfilePageSelectors = [
  ProfilePageToUrl(),
  ProfilePageToHandle(),
];
