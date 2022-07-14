import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/theme.dart';

class ArticlePage extends StatelessWidget {
  bool isFavorite;
  ArticleModel article;

  ArticlePage({
    Key? key,
    this.isFavorite = false,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 400.0,
                  collapsedHeight: 120,
                  actions: <Widget>[
                    BlocBuilder<FavoriteArticleCubit, List<int>>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context
                                .read<FavoriteArticleCubit>()
                                .toggleFavorite(article.id);
                          },
                          icon: (state.contains(article.id))
                              ? Icon(
                                  Icons.favorite,
                                  color: kRedColor,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: kOrangeColor,
                                ),
                        );
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.all(0),
                    centerTitle: true,
                    title: Container(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        bottom: 12.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(article.url),
                          colorFilter: ColorFilter.mode(
                            kBlackColor.withOpacity(0.4),
                            BlendMode.dstATop,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMMEEEEd().format(article.date_gmt),
                            style: body4TextStyle.copyWith(
                              color: (state is ThemeLight)
                                  ? kBlackColor
                                  : kWhiteColor,
                            ),
                          ),
                          Text(
                            article.title,
                            style: h2TextStyle.copyWith(
                              color: (state is ThemeLight)
                                  ? kBlackColor
                                  : kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kLightGreyColor.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        clipBehavior: Clip.none,
                        // height: 5000,
                        color:
                            (state is ThemeLight) ? kWhiteColor : kBlackColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Html(
                          data: article.content,
                          tagsList: Html.tags
                            ..remove('nav')
                            ..remove('a')
                            ..remove('noscript'),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
