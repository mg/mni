import '../engine.dart';

class DataSet {
  List<Data> dataList = [];
  void addData(Data data) {
    dataList.add(data);
  }

  void removeAt(int idx) {
    dataList.removeAt(idx);
  }

  List<Data> generateDataSets() {
    List<Data> dataSets = [];
    for (final data in dataList) {
      if (data.hasValue) {
        dataSets.add(data);
      }
    }
    return dataSets;
  }
}
