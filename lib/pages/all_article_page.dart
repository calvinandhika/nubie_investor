import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/article_cubit.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/widget/article_tile.dart';
import 'package:nubie_investor/widget/shared/custom_app_bar.dart';
import 'package:nubie_investor/widget/shared/custom_bottom_navigation_bar.dart';

class AllArticlePage extends StatelessWidget {
  const AllArticlePage({Key? key}) : super(key: key);

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
                            return ListView.builder(
                              physics: const ScrollPhysics(),
                              itemCount: articleState.articles.length,
                              itemBuilder: (context, index) {
                                return ArticleTile(
                                  isFavorite: (state.contains(
                                          articleState.articles[index].id))
                                      ? true
                                      : false,
                                  article: articleState.articles[index],
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
