import 'package:flutter/widgets.dart';
import 'package:mni/engine.dart';

abstract class PipelinePainter extends CustomPainter {
  PipelinePainter();

  PipelinePainter withPipeline(Pipeline pipeline) => this..pipeline = pipeline;

  Pipeline? pipeline;

  @override
  bool shouldRepaint(PipelinePainter oldDelegate) => true;
}

abstract class PipelinePainterBuilder {
  late Pipeline pipeline;
  PipelinePainterBuilder withPipeline(Pipeline pipeline) =>
      this..pipeline = pipeline;

  PipelinePainter build();
}
