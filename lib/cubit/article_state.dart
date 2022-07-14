part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleFailed extends ArticleState {
  String error;

  ArticleFailed(this.error);

  @override
  List<Object> get props => [error];
}

class ArticleSuccess extends ArticleState {
  List<ArticleModel> articles;
  List<ArticleCategoryModel> articlesCategory;
  // List<ArticleModel> articlesPerCategory;

  ArticleSuccess(
    this.articles,
    this.articlesCategory,
    // this.articlesPerCategory,
  );

  @override
  List<Object> get props => [
        articles,
        articlesCategory,
        // articlesPerCategory,
      ];
}
