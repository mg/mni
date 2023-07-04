import 'package:flutter_test/flutter_test.dart';
import 'package:mni/engine.dart';
import 'test_result.dart';

void main() {
  test('Simple pipeline', () {
    final dataSet = DataSet();
    final data1 = Text('some value');
    dataSet.addData(data1);

    final pipeline = Pipeline();
    pipeline.addDataSet(dataSet);

    final result = TestResult();
    pipeline.setResultStore(result);

    pipeline.run();

    expect(result.result, [data1.value]);
  });

  test('Transform to uppercase', () {
    final dataSet = DataSet();
    dataSet.addData(Text('some value'));
    dataSet.addData(Text('another value'));

    final pipeline = Pipeline();
    pipeline.addDataSet(dataSet);
    pipeline.addTransformer(TextToUpperCase());

    final result = TestResult();
    pipeline.setResultStore(result);

    pipeline.run();

    expect(result.toString(), 'SOME VALUE,ANOTHER VALUE');
  });

  test('Name pipelines', () {
    final result = TestResult();

    final dataSet = DataSet();
    final name = Name();
    name.firstName.value = "Magnús";
    name.middleNames.add(Text('Örn'));
    name.patronymicName.value = "Gylfason";
    name.title = NameTitle.mr;

    dataSet.addData(name);

    final firstNamePipeline = Pipeline();
    firstNamePipeline.addDataSet(dataSet);
    firstNamePipeline.addSelector(NameToFirstName());
    firstNamePipeline.addTransformer(TextToUpperCase());
    firstNamePipeline.addTransformer(TextToASCII());
    firstNamePipeline.setResultStore(result);
    firstNamePipeline.run();
    expect(result.toString(), 'MAGNUS');
    result.reset();

    final fullNamePipeline = Pipeline();
    fullNamePipeline.addDataSet(dataSet);
    fullNamePipeline.addSelector(NameToFullName());
    fullNamePipeline.addTransformer(TextToASCII());
    fullNamePipeline.setResultStore(result);
    fullNamePipeline.run();
    expect(result.toString(), 'Magnus Orn Gylfason');
    result.reset();

    final titledSurNamePipeline = Pipeline();
    titledSurNamePipeline.addDataSet(dataSet);
    titledSurNamePipeline.addSelector(NameToTitledSurName());
    titledSurNamePipeline.addTransformer(TextToUpperCase());
    titledSurNamePipeline.setResultStore(result);
    titledSurNamePipeline.run();
    expect(result.toString(), 'MR. GYLFASON');
  });

  test('Phone number pipeline', () {
    final renderer = TestResult();

    final dataSet = DataSet();
    final phoneNumber = PhoneNumber();
    phoneNumber.phoneNumber.value = '698 9023';
    phoneNumber.countryCode.value = '354';
    dataSet.addData(phoneNumber);

    final phoneNumberPipeline = Pipeline();
    phoneNumberPipeline.addDataSet(dataSet);
    phoneNumberPipeline.addSelector(ToLocalPhoneNumber());
    phoneNumberPipeline.setResultStore(renderer);
    phoneNumberPipeline.run();

    expect(renderer.toString(), '698 9023');
    renderer.reset();

    final fullPhoneNumberPipeline = Pipeline();
    fullPhoneNumberPipeline.addDataSet(dataSet);
    fullPhoneNumberPipeline.addSelector(ToInternationalPhoneNumber());
    fullPhoneNumberPipeline.setResultStore(renderer);
    fullPhoneNumberPipeline.run();

    expect(renderer.toString(), '+354 698 9023');
  });

  test('Email pipeline', () {
    final renderer = TestResult();

    final dataSet = DataSet();
    final email = Email();
    email.username.value = 'magnus.gylfason';
    email.domain.value = 'gmail.com';
    dataSet.addData(email);

    final emailPipeline = Pipeline();
    emailPipeline.addDataSet(dataSet);
    emailPipeline.addSelector(EmailToFQE());
    emailPipeline.setResultStore(renderer);
    emailPipeline.run();

    expect(renderer.toString(), 'magnus.gylfason@gmail.com');
  });

  test('Nme + address pipeline', () {
    final result = TestResult();

    final dataSet = DataSet();
    final name = Name();
    name.firstName.value = "Magnús";
    name.middleNames.add(Text('Örn'));
    name.patronymicName.value = "Gylfason";
    name.title = NameTitle.mr;
    dataSet.addData(name);

    final address = Address();
    address.streetAddress.value = 'Æsuborgir 16';
    address.city.value = 'Reykjavík';
    address.postCode.value = '112';
    address.country.value = 'Iceland';
    dataSet.addData(address);

    final nameAddressPipeline = Pipeline();
    nameAddressPipeline.addDataSet(dataSet);
    nameAddressPipeline.addSelector(NameToFullName());
    nameAddressPipeline.addSelector(AddressToFullAddress());
    nameAddressPipeline.setResultStore(result);
    nameAddressPipeline.run();

    expect(result.toString(),
        'Magnús Örn Gylfason,Æsuborgir 16,Reykjavík, 112,Iceland');
  });
}
