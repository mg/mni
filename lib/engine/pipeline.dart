import '../engine.dart';

class Pipeline {
  late DataSet dataSet;
  void addDataSet(DataSet dataSet) {
    this.dataSet = dataSet;
  }

  final List<Selector> selectors = [];
  void addSelector(Selector selector) {
    selectors.add(selector);
  }

  bool isSelectorSelected(Selector selector) {
    return selectors.contains(selector);
  }

  final List<Transformer> transformers = [];
  void addTransformer(Transformer transformer) {
    transformers.add(transformer);
  }

  PipelineResult pipelineResult = PipelineResult();
  void setResultStore(PipelineResult pipelineResult) {
    this.pipelineResult = pipelineResult;
  }

  List<String> run() {
    List<Text> dataItems = List<Text>.empty(growable: true);

    final validData = dataSet.generateDataSets();

    for (final data in validData) {
      if (selectors.isEmpty) {
        dataItems.addAll(data.asRawData());
      } else {
        for (final selector in selectors) {
          dataItems.addAll(selector.select(data));
        }
      }
    }

    List<String> stringsToRender = List<String>.empty(growable: true);
    if (dataItems.isNotEmpty) {
      for (var data in dataItems) {
        for (final transformer in transformers) {
          data = transformer.transform(data);
        }
        stringsToRender.add(data.value);
      }
    }

    pipelineResult.storeResult(stringsToRender);
    return stringsToRender;
  }

  List<Selector> generatePossibleSelectors() {
    final List<Selector> selectors = [];
    for (final data in dataSet.generateDataSets()) {
      for (final selector in kSelectors) {
        if (selector.isValidFor(data)) {
          selectors.add(selector);
        }
      }
    }
    return selectors;
  }
}
