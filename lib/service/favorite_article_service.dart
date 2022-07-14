import 'package:shared_preferences/shared_preferences.dart';

class FavoriteArticleService {
  Future<void> setFavorite(List<int> favs) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> tempFav = [];

      if (prefs.getStringList('favoriteArticle') == null) {
        prefs.setStringList('favoriteArticle', tempFav);
      }

      tempFav = favs.map((fav) => fav.toString()).toList();
      prefs.setStringList('favoriteArticle', tempFav);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> getFavorite() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> tempFav = [];

      tempFav = prefs.getStringList('favoriteArticle') ?? [];
      if (tempFav.isEmpty) {
        return [];
      } else {
        return tempFav.map((fav) => int.parse(fav)).toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
