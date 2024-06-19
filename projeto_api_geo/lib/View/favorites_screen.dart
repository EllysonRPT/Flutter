import 'package:flutter/material.dart';
import '../Model/city_model.dart';
import '../Service/favorite_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  List<City> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await _favoritesService.getFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cidades Favoritas'),
      ),
      body: _favorites.isEmpty
          ? Center(child: Text('Nenhuma cidade favoritada.', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final city = _favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      city.cityName,
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await _favoritesService.removeFavorite(city);
                        _loadFavorites();
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
