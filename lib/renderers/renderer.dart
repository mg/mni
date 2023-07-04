import 'pipeline_painter.dart';

class Renderer {
  Renderer(this.builder);
  final PipelinePainterBuilder builder;

  PipelinePainter buildPainter() {
    return builder.build();
  }
}
