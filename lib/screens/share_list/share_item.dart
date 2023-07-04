import 'package:flutter/widgets.dart';
import 'package:applib/effects.dart';
import 'package:mni/share.dart';
import 'package:mni/renderers.dart';

class ShareItem extends StatelessWidget {
  const ShareItem({required this.shareRecipe, this.onPress, Key? key})
      : super(key: key);

  final ShareRecipe shareRecipe;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: shareRecipe.id,
      child: Row(
        children: [
          Text(shareRecipe.name),
          SizedBox(
            width: 100,
            height: 80,
            child: PipelineWidget(
              painter: shareRecipe.defaultPainter,
            ),
          ),
        ],
      ),
    ).onPress(onPress);
  }
}
