import 'package:applib/effects.dart';
import 'package:flatter/flatter.dart';
import 'package:flutter/widgets.dart';
import 'package:mni/share.dart';

// https://pub.dev/packages/morpheus#-readme-tab-

class SceneScreen extends StatelessWidget {
  const SceneScreen({required this.shareRecipe, Key? key}) : super(key: key);

  final ShareRecipe shareRecipe;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: shareRecipe.id,
      child: Text(shareRecipe.name).fontSize(30),
    ).onPress(() {
      Navigator.of(context).pop();
    });
  }
}
