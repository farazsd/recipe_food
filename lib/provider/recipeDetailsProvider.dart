import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../repo/repo.dart';
import '../models/recipes_details_model.dart';

class RecipeDetailsProvider extends ChangeNotifier {
  bool _isLoding = false;
  bool _haveData = true;
  RecipeDetailsModel? _receipeDetailsList;
  RecipeDetailsModel? get favoriteList => _receipeDetailsList;
  bool get isLoding => _isLoding;
  bool get haveData => _haveData;
  Repo repo = Repo();

  Future<void> fetchAndSetRecipeDetails(int recipeId) async {
    _isLoding = true;
    notifyListeners();

    try {
      // _favoriteList = await repo.recipeDetails(recipeId);
      final result = await repo.recipeDetails(recipeId);
      _receipeDetailsList = RecipeDetailsModel.fromJson(result);
      log("fetchAndSetRecipeDetails==>>${result.toString()}");
      log("favorite==>>$_receipeDetailsList");
      log("_favoriteList==>>${_receipeDetailsList?.toJson()}");

      if (_receipeDetailsList != null) {
        log("_favoriteList==>>${_receipeDetailsList!.toJson()}");
        _haveData = true;
      } else {
        _haveData = false;
      }
    } catch (error) {
      _haveData = false;
    } finally {
      _isLoding = false;
      notifyListeners();
    }
  }
}
