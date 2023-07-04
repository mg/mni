import 'dart:io';

import 'package:mni/engine.dart';
import 'package:mni/renderers.dart';

class ShareRecipe {
  ShareRecipe({
    required this.id,
    required this.name,
    required this.pipeline,
    required this.painterBuilder,
  });

  String id;
  String name;
  Pipeline pipeline;
  PipelinePainterBuilder painterBuilder;

  PipelinePainterBuilder get defaultPainterBuilder =>
      painterBuilder.withPipeline(pipeline);
}
