import 'package:flutter/widgets.dart';
import 'package:applib/layout.dart';
import 'package:applib/chrome.dart';
import 'package:mni/env.dart';
import 'package:mni/share.dart';
import '../scene/scene_screen.dart';
import 'share_item.dart';
import 'package:flutter/material.dart';

class ShareListScreen extends StatelessWidget {
  const ShareListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shareRepository = Env.shareRepository;

    return ScreenView(
      backgroundBuilder: BrightnessBackground.builder,
      children: [
        ListenableBuilder(
          listenable: shareRepository,
          builder: (context, _) => Column(
            children: [
              for (final share in shareRepository.recipes.values)
                ShareItem(
                  shareRecipe: share,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SceneScreen(shareRecipe: share);
                      }),
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
