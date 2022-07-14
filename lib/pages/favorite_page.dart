import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/article_category_cubit.dart';
import 'package:nubie_investor/cubit/article_cubit.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/article_tile.dart';
import 'package:nubie_investor/widget/shared/custom_app_bar.dart';
import 'package:nubie_investor/widget/shared/custom_bottom_navigation_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            state: state,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Builder(
                builder: (context) {
                  return BlocBuilder<ArticleCubit, ArticleState>(
                    builder: (context, articleState) {
                      return BlocBuilder<FavoriteArticleCubit, List<int>>(
                        builder: (context, state) {
                          if (articleState is ArticleSuccess) {
                            List<ArticleModel?> favoriteArticles = context
                                .read<ArticleCubit>()
                                .fetchArticleByFavorite(
                                  articles: articleState.articles,
                                  favorite: state,
                                );
                            if (favoriteArticles.length == 0) {
                              return Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/favorite_article_not_found.png',
                                    width: 300,
                                  ),
                                  Text(
                                    'Belum ada favorite',
                                    style: body1TextStyle,
                                  ),
                                ],
                              ));
                            }
                            return ListView.builder(
                              physics: const ScrollPhysics(),
                              itemCount: favoriteArticles.length,
                              itemBuilder: (context, index) {
                                return ArticleTile(
                                  isFavorite: (state.contains(
                                          favoriteArticles[index]?.id))
                                      ? true
                                      : false,
                                  article: favoriteArticles[index]!,
                                );
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    },
                  );
                },
              ),
              const CustomBottomNavigationBar()
            ],
          ),
        );
      },
    );
  }
}
