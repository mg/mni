import 'package:mni/engine.dart';

class TestResult extends PipelineResult {
  @override
  String toString() {
    if (result == null) return '';
    return result!.join(',');
  }

  void reset() {
    result = null;
  }
}
