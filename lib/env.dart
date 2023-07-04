import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'share.dart';

enum BrightnessMode {
  device,
  dark,
  light,
}

class Env extends ChangeNotifier {
  // singleton setup
  Env._sharedInstance();
  static final Env _shared = Env._sharedInstance();
  factory Env() => _shared;
  static Env get instance => _shared;

  late ShareRepository _shareRepository;
  SharedPreferences? _prefs;

  static Future initialize() async {
    final futures = List<Future>.empty(growable: true);

    futures.add(SharedPreferences.getInstance()); // 2: shared prefix instance
    await Future.wait(futures);

    // read share repository
    instance._shareRepository = ShareRepository();
    initShareRepository(instance._shareRepository);

    // current device settings
    instance._prefs = await futures[0] as SharedPreferences;

    // final prefs = instance._prefs;
    // get from prefs or locale
    /* final prefsBrightnessMode = prefs?.getString('brightnessMode');
    if (prefsBrightnessMode == null) {
      instance._brightnessMode = BrightnessMode.system;
      prefs?.setString('brightnessMode', BrightnessMode.system);
    } else {
      instance._brightnessMode = BrightnessMode.values.byName(prefsBrightnessMode);
    }*/
  }

  static Future initializeForMocks() async {}

  late BrightnessMode _brightnessMode;
  static BrightnessMode get brightnessMode => instance._brightnessMode;
  static set brightnessMode(BrightnessMode brightnessMode) {
    instance._brightnessMode = brightnessMode;
    instance._prefs?.setString('brightnessMode', brightnessMode.name);
    instance.notifyListeners();
  }

  static ShareRepository get shareRepository => instance._shareRepository;
  /*
  static StateObjectNotifier<Env> get envNotifier => _shared.notifier();

  static ValueListenableBuilder<Env> listener(StateObjectNotifier<Env> notifier,
      Widget Function(BuildContext, Widget?) builder) {
    return _shared.listenerBuilder(
        notifier, (context, _, child) => builder(context, child));
  }
  */
}
