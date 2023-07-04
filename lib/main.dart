import 'package:flutter/widgets.dart';
import 'package:applib/device.dart';
import 'package:applib/platform.dart';
import 'env.dart';
import 'screens/share_list/share_list_screen.dart';

void main() async {
  setupEdgeToEdge();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    Env.initialize().then((val) {
      setState(() {
        initialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return App(
      title: 'My Name Is',
      child: initialized ? const ShareListScreen() : Container(),
    );
  }
}
