import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nubie_investor/model/article_category_model.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/service/article_service.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  Future<void> fetchAllArticles() async {
    if (state == ArticleInitial()) {
      emit(ArticleLoading());
      List<ArticleModel> articles = await ArticleService().fetchAllArticle();
      List<ArticleCategoryModel> articlesCategory =
          await ArticleService().fetchArticlesCategory();

      emit(
        ArticleSuccess(
          articles,
          articlesCategory,
        ),
      );
    }
  }

  Future<void> setArticleInitial() async {
    try {
      emit(ArticleInitial());
      await fetchAllArticles();
    } catch (e) {
      rethrow;
    }
  }

  List<ArticleModel?> fetchArticleByCategory({
    required List<ArticleModel> articles,
    required int category,
  }) {
    List<ArticleModel?> a = [];
    articles.map((article) {
      if (article.categories.contains(category)) {
        a.add(article);
      }
    }).toList();
    return a;
  }

  List<ArticleModel?> fetchArticleByFavorite({
    required List<ArticleModel> articles,
    required List<int> favorite,
  }) {
    List<ArticleModel?> a = [];
    articles.map((article) {
      if (favorite.contains(article.id)) {
        a.add(article);
      }
    }).toList();
    return a;
  }
}
