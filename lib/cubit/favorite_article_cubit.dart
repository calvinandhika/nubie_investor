import 'package:bloc/bloc.dart';
import 'package:nubie_investor/service/favorite_article_service.dart';

class FavoriteArticleCubit extends Cubit<List<int>> {
  FavoriteArticleCubit() : super(<int>[]);

  List<int> categories = [];
  void fetchFavorite() async {
    List<int> a = await FavoriteArticleService().getFavorite();
    emit(a.toList());
  }

  void toggleFavorite(int articleId) {
    if (state.contains(articleId)) {
      categories.remove(articleId);
      FavoriteArticleService().setFavorite(categories);
      emit(categories.toList());
    } else {
      categories.add(articleId);
      FavoriteArticleService().setFavorite(categories);
      emit(categories.toList());
    }
  }
}
