import 'dart:convert';
import 'dart:developer';
import '../helpers/api_helpers.dart';
import '../models/searchByIngredientsModel.dart';
import '../utils/apis.dart';

class Repo {
  Future<List<SearchByIngredientsModel>> searchByIngredients(
      ingredients) async {
    var url =
        "${Apis.baseUrl}${Apis.findByIngredients}?apiKey=${Apis.apiKey}&ingredients=$ingredients";
    print("call the integratedQuery api ===> $url");
    final response = await APIHelpers.apiGetRequest(url);
    print("call the integratedQuery api ===> $response");
    if (jsonDecode(response) != null) {
      final List<dynamic> result = jsonDecode(response);
      return result
          .map((item) => SearchByIngredientsModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future recipeDetails(recipeId) async {
    var url =
        "${Apis.baseUrl}$recipeId/${Apis.recipeDetails}?apiKey=${Apis.apiKey}";
    print("call the integratedQuery api ===> $url");
    final response = await APIHelpers.apiGetRequest(url);
    print("call the integratedQuery api ===> $response");
    if (response != "") {
      final result = jsonDecode(response);
      log("result==>>${result.toString()}");
      // var recipeDetailsList = RecipeDetailsModel.fromJson(result);
      // log("favoriteList==>>${recipeDetailsList.toString()}");
      return result;
    } else {
      throw Exception('Failed to load recipes details');
    }
  }
}
