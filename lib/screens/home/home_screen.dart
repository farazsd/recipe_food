import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../provider/searchIngredientsProvider.dart';
import '../recipe_details/favoritesScreen.dart';
import '../recipe_details/recipes_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String ingredients = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Finder'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const FavoritesScreen()),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Ingredients',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Enter ingredient',
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                  );
                } else {
                  await Provider.of<SearchByIngredientsProvider>(context,
                          listen: false)
                      .searchByIngredients(_controller.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: const Text('Search Recipes'),
            ),
            const SizedBox(height: 16.0),
            Consumer<SearchByIngredientsProvider>(
              builder: (context, data, child) {
                var item = data.orRecipeList;
                log("Loading: ${data.isLoding}");
                log("Have Data: ${data.haveData}");
                return data.isLoding
                    ? const Center(child: CircularProgressIndicator())
                    : data.orRecipeList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                final recipe = item[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  onTap: () {
                                    log("Receipe Id==>${recipe.id}");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RecipeDetailScreen(
                                                recipeId: recipe.id!),
                                      ),
                                    );
                                  },
                                  leading: recipe.image != null
                                      ? Image.network(
                                          recipe.image!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Icon(Icons.error,
                                                    color: Colors.red),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(),
                                  title: Text(
                                    recipe.title ?? '',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(child: Text("No data found"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
