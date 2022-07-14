import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/pages/article_page.dart';
import 'package:nubie_investor/theme.dart';

class ArticleTile extends StatelessWidget {
  bool isFavorite;
  final ArticleModel article;

  ArticleTile({
    Key? key,
    this.isFavorite = false,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ),
        );
      },
      child: Container(
        height: 128,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 8,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(article.url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              kLightGreyColor.withOpacity(0.8),
              BlendMode.srcATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 8,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      article.title,
                      style: h4TextStyle.copyWith(
                        color: kWhiteColor,
                        height: 20.8 / 16,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 5,
                child: Center(
                  child: SizedBox(
                    child: IconButton(
                      onPressed: () {
                        context
                            .read<FavoriteArticleCubit>()
                            .toggleFavorite(article.id);
                      },
                      icon: isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: kRedColor,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: kOrangeColor,
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMMEEEEd().format(article.date_gmt),
                      style: body4TextStyle.copyWith(
                        color: kWhiteColor,
                        height: 20.8 / 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
