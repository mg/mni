import 'package:flutter_test/flutter_test.dart';
import 'package:mni/engine.dart';

void main() {
  test('Generate valid set', () {
    final dataSet = DataSet();
    final data1 = Text('some value');
    final data2 = Text();
    dataSet.addData(data1);
    dataSet.addData(data2);

    expect(dataSet.generateDataSets(), [data1]);
  });
}
