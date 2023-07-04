import 'package:flutter/widgets.dart';
import 'package:mni/renderers/pipeline_painter.dart';

class LandscapePainter extends PipelinePainter {
  @override
  void paint(Canvas canvas, Size size) {
    if (pipeline == null) return;
    final result = pipeline!.run();

    final width = size.width > size.height ? size.width : size.height;
    final height = size.height > size.width ? size.width : size.height;

    final fillPaint = Paint()..color = Color(0xff000000);
    //..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), fillPaint);

    print("$width, $height, ${height / result.length}");
    const textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 12, // height / result.length,
    );

    for (final line in result) {
      final textSpan = TextSpan(
        text: line,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: width,
      );

      final xCenter = (width - textPainter.width) / 2;
      final yCenter = (height - textPainter.height) / 2;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }
  }
}

class LandscapePainterBuilder extends PipelinePainterBuilder {
  @override
  PipelinePainter build() {
    return LandscapePainter();
  }
}
