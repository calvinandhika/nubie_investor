import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/article_category_cubit.dart';
import 'package:nubie_investor/cubit/article_cubit.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/pages/all_article_page.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/article_tile.dart';
import 'package:nubie_investor/widget/chip_article_category.dart';
import 'package:nubie_investor/widget/shared/custom_app_bar.dart';
import 'package:nubie_investor/widget/shared/custom_bottom_navigation_bar.dart';
import 'package:nubie_investor/widget/main_banner_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ArticleCubit>().fetchAllArticles();
    context.read<ThemeCubit>().fetchTheme();
    context.read<FavoriteArticleCubit>().fetchFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<ArticleCubit>().setArticleInitial();
          },
          child: Scaffold(
            appBar: CustomAppBar(
              state: themeState,
            ),
            body: BlocBuilder<ArticleCubit, ArticleState>(
              builder: (context, state) {
                if (state is ArticleLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kBlueColor,
                    ),
                  );
                }
                if (state is ArticleSuccess) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      ListView(
                        children: [
                          header(),
                          mainBanner(),
                          categorySelection(),
                          articleList(),
                        ],
                      ),
                      const CustomBottomNavigationBar(),
                    ],
                  );
                }
                return const Center(
                  child: Text('Unknown Error Please Contact Us'),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Latest Article',
            style: h2TextStyle,
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllArticlePage(),
                ),
              );
            },
            icon: const Text('See All'),
            label: const Icon(Icons.keyboard_arrow_right_outlined),
            style: TextButton.styleFrom(
              primary: kBlueColor,
              padding: const EdgeInsets.only(
                left: 10,
                top: 5,
                right: 3,
                bottom: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainBanner() {
    return Builder(
      builder: (context) {
        return Container(
          height: 240,
          padding: const EdgeInsets.only(
            bottom: 24,
          ),
          child: BlocBuilder<ArticleCubit, ArticleState>(
            builder: (context, state) {
              if (state is ArticleSuccess) {
                int length;
                (state.articles.length >= 5)
                    ? length = 5
                    : length = state.articles.length;

                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: length,
                    itemBuilder: (context, index) {
                      return MainBannerCard(
                        article: state.articles[index],
                      );
                    }
                    // SizedBox(width: defaultMargin),
                    );
              }
              return const Center(
                child: Text('Unknown Error, please contact us'),
              );
            },
          ),
        );
      },
    );
  }

  Widget categorySelection() {
    return Builder(builder: (context) {
      return Container(
        height: 34,
        margin: const EdgeInsets.only(bottom: 16),
        child: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            if (state is ArticleSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.articlesCategory.length,
                itemBuilder: (context, index) {
                  var category = state.articlesCategory[index];
                  if (category.count == 0) {
                    return const SizedBox();
                  } else {
                    return ChipArticleCategory(
                      id: category.id,
                      title: category.name,
                    );
                  }
                },
              );
            }
            return const Center(
              child: Text('Unknown Error, please contact us'),
            );
          },
        ),
      );
    });
  }

  Widget articleList() {
    return Builder(
      builder: (context) {
        return BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, articleState) {
            return BlocBuilder<ArticleCategoryCubit, int>(
              builder: (context, categoryState) {
                if (articleState is ArticleSuccess) {
                  List<ArticleModel?> articles =
                      context.read<ArticleCubit>().fetchArticleByCategory(
                            articles: articleState.articles,
                            category: categoryState,
                          );

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 150.0),
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlocBuilder<FavoriteArticleCubit, List<int>>(
                          builder: (context, state) {
                            return ArticleTile(
                              isFavorite: (state.contains(articles[index]?.id))
                                  ? true
                                  : false,
                              article: articles[index]!,
                            );
                          },
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            );
          },
        );
      },
    );
  }
}
