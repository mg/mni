import 'package:flutter/widgets.dart';
import 'package:mni/engine.dart' as pipe_line;
import 'share_recipe.dart';

class ShareRepository extends ChangeNotifier {
  ShareRepository();

  final Map<String, ShareRecipe> recipes = {};

  void add(String id, ShareRecipe recipe) {
    recipes[id] = recipe;
    notifyListeners();
  }
}

void initShareRepository(ShareRepository shareRepository) {
  final dataSet = pipe_line.DataSet();
  dataSet.addData(pipe_line.Text('Magnús Örn Gylfason'));
  final firstNamePipeline = pipe_line.Pipeline();
  firstNamePipeline.addDataSet(dataSet);

  final firstName = ShareRecipe(
    id: 'firstName',
    name: 'First name',
    pipeline: firstNamePipeline,
    painterBuilder: pipe_line.LandscapePainterBuilder(),
  );

  shareRepository.add(firstName.id, firstName);
}
