import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../../helpers/dbHelpers.dart';
import '../../provider/recipeDetailsProvider.dart';

class RecipeDetailScreen extends StatefulWidget {
  final int recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isFavorite = false;
  double height = 0;
  double width = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<RecipeDetailsProvider>(context, listen: false)
        .fetchAndSetRecipeDetails(widget.recipeId);
    checkFavoriteStatus();
  }

  Future<void> checkFavoriteStatus() async {
    bool favoriteStatus =
        await DBHelper.instance.isRecipeFavorite(widget.recipeId);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Details"),
        centerTitle: true,
      ),
      body: Consumer<RecipeDetailsProvider>(builder: (context, data, child) {
        final item = data.favoriteList;
        return data.isLoding == false && data.haveData == true
            ? ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          item!.image.toString(),
                          height: height / 3.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              height: height / 3.5,
                              width: double.infinity,
                              child: const Center(
                                child: Icon(Icons.error, color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                if (isFavorite) {
                                  await DBHelper.instance
                                      .deleteFavorite(widget.recipeId);
                                } else {
                                  Map<String, dynamic> favoriteData = {
                                    'id': widget.recipeId,
                                    'name': item.title.toString(),
                                    'image': item.image.toString(),
                                    'cookingTime': item.readyInMinutes,
                                  };
                                  await DBHelper.instance
                                      .insertFavorite(favoriteData);
                                }
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                Share.share(
                                  'Check out this delicious recipe: ${item.title.toString()}\n'
                                  'Cooking Time: ${item.readyInMinutes.toString()} minutes\n'
                                  'Image: ${item.image.toString()}',
                                  subject: 'Recipe sharing',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width / 1.4,
                          child: Text(
                            item.title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.vegetarian == true ? 'Veg' : "Non-Veg",
                            style: TextStyle(
                              color: item.vegetarian == true
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Summary :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 6),
                    child: Text(
                      removeHtmlTags(item.summary.toString()),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Text(
                          "Cooking Time :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "${item.readyInMinutes} minutes",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Text(
                          "Servings :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          item.servings.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "List of Ingredients :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Units",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: item.extendedIngredients!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: item.extendedIngredients!.length,
                            itemBuilder: (context, index) {
                              var ingredients =
                                  item.extendedIngredients![index];
                              int itemNumber = index + 1;
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$itemNumber : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              ingredients.name.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color:
                                                    Colors.red.withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ingredients.unit.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color:
                                                  Colors.red.withOpacity(0.8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : const Text("No Ingredients Found"),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Cooking Instructions :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 6, bottom: 20),
                    child: Text(
                      item.instructions != ""
                          ? removeHtmlTags(item.instructions.toString())
                          : "No Instruction Available",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            : data.haveData == false
                ? const Center(child: Text("No data found"))
                : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  String removeHtmlTags(String htmlString) {
    final RegExp regExp = RegExp(r'<[^>]*>');
    return htmlString.replaceAll(regExp, '');
  }
}
