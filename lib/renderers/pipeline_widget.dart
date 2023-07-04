import 'package:flutter/widgets.dart';
import 'pipeline_painter.dart';

class PipelineWidget extends StatefulWidget {
  const PipelineWidget({required this.painter, super.key});
  final PipelinePainter painter;

  @override
  State<PipelineWidget> createState() => _PipelineWidgetState();
}

enum RenderState {
  fullScreen,
  expanding,
  collapsing,
  contained,
}

class _PipelineWidgetState extends State<PipelineWidget>
    with SingleTickerProviderStateMixin<PipelineWidget> {
  RenderState renderState = RenderState.contained;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() => onAnimationUpdate(animationController.value));
    animationController.forward();
  }

  void onAnimationUpdate(double value) {
    print(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: widget.painter,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
