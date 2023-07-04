import 'package:flutter_test/flutter_test.dart';
import 'package:mni/engine.dart';

void main() {
  test('generatePossibleSelectors: text test', () {
    final dataSet = DataSet();
    dataSet.addData(Text("some value"));

    final pipeline = Pipeline();
    pipeline.addDataSet(dataSet);
    expect(pipeline.generatePossibleSelectors(), [
      kSelectors.whereType<SelectFromText>().first,
    ]);
  });

  test('generatePossibleSelectors: name test', () {
    final dataSet = DataSet();
    final name = Name();
    dataSet.addData(name);

    final pipeline = Pipeline();
    pipeline.addDataSet(dataSet);
    expect(pipeline.generatePossibleSelectors(), []);

    name.firstName.value = "Magnús";
    expect(
      pipeline.generatePossibleSelectors(),
      [
        kSelectors.whereType<NameToFirstName>().first,
      ],
    );

    name.familyName.value = 'Gylfason';
    expect(
      pipeline.generatePossibleSelectors(),
      [
        kSelectors.whereType<NameToFirstName>().first,
        kSelectors.whereType<NameToSurName>().first,
        kSelectors.whereType<NameToFullName>().first,
      ],
    );

    name.title = NameTitle.mr;
    expect(
      pipeline.generatePossibleSelectors(),
      [
        kSelectors.whereType<NameToFirstName>().first,
        kSelectors.whereType<NameToSurName>().first,
        kSelectors.whereType<NameToTitledSurName>().first,
        kSelectors.whereType<NameToTitledFirstName>().first,
        kSelectors.whereType<NameToFullName>().first,
      ],
    );
  });

  test('generatePossibleSelectors: name/email test', () {
    final dataSet = DataSet();
    final name = Name();
    dataSet.addData(name);
    final email = Email();
    dataSet.addData(email);

    final pipeline = Pipeline();
    pipeline.addDataSet(dataSet);
    expect(pipeline.generatePossibleSelectors(), []);

    name.firstName.value = "Magnús";
    name.familyName.value = 'Gylfason';
    email.username.value = 'magnus.gylfason';
    expect(
      pipeline.generatePossibleSelectors(),
      [
        kSelectors.whereType<NameToFirstName>().first,
        kSelectors.whereType<NameToSurName>().first,
        kSelectors.whereType<NameToFullName>().first,
      ],
    );

    email.domain.value = 'gmail.com';
    expect(
      pipeline.generatePossibleSelectors(),
      [
        kSelectors.whereType<NameToFirstName>().first,
        kSelectors.whereType<NameToSurName>().first,
        kSelectors.whereType<NameToFullName>().first,
        kSelectors.whereType<EmailToFQE>().first,
      ],
    );
  });
}
