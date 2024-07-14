import 'package:flutter/material.dart';
import '../../../../../repo/repo.dart';
import '../models/searchByIngredientsModel.dart';

class SearchByIngredientsProvider extends ChangeNotifier {
  bool _isLoding = false;
  bool _haveData = true;
  List<SearchByIngredientsModel> _orRecipeList = [];
  List<SearchByIngredientsModel> get orRecipeList => _orRecipeList;
  bool get isLoding => _isLoding;
  bool get haveData => _haveData;
  Repo repo = Repo();

  Future<void> searchByIngredients(ingredients) async {
    _isLoding = true;
    notifyListeners();
    _orRecipeList = await repo.searchByIngredients(ingredients);
    _isLoding = false;
    if (_orRecipeList.isEmpty) {
      _haveData = false;
    } else {
      _haveData = true;
    }
    notifyListeners();
  }
}
