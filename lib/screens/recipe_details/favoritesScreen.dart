import 'package:flutter/material.dart';
import 'package:food_finder/screens/recipe_details/recipes_details.dart';

import '../../helpers/dbHelpers.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    _getFavoritesFromDB();
  }

  void _getFavoritesFromDB() async {
    List<Map<String, dynamic>> fetchedFavorites =
        await DBHelper.instance.getFavorites();
    setState(() {
      favorites = fetchedFavorites;
    });
  }

  void _deleteFavorite(int id) async {
    await DBHelper.instance.deleteFavorite(id);
    _getFavoritesFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Recipe'),
        centerTitle: true,
      ),
      body: favorites.isNotEmpty
          ? Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(favorites[index]['id'].toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      _deleteFavorite(favorites[index]['id']);
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(
                                recipeId: favorites[index]['id']),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0.7,
                        color: Colors.grey[50],
                        shadowColor: Colors.white,
                        child: ListTile(
                          title: Text(favorites[index]['name'].toString()),
                          subtitle: Text(
                              'Cooking Time: ${favorites[index]['cookingTime']}'),
                          leading: Image.network(
                            favorites[index]['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                                child: const Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(child: Text("No Data Found")),
    );
  }
}
