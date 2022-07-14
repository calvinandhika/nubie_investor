import 'package:flutter/material.dart';
import 'package:nubie_investor/model/article_model.dart';
import 'package:nubie_investor/pages/article_page.dart';
import 'package:nubie_investor/theme.dart';

class MainBannerCard extends StatelessWidget {
  final ArticleModel article;
  const MainBannerCard({
    Key? key,
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
        height: 240,
        margin: EdgeInsets.only(left: defaultMargin),
        width: MediaQuery.of(context).size.width * 7 / 8,
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
              BlendMode.difference,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Positioned(
                top: 65,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      article.title,
                      style: h3TextStyle.copyWith(
                        color: kWhiteColor,
                        height: 20.8 / 16,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      maxLines: 3,
                      article.description,
                      overflow: TextOverflow.ellipsis,
                      style: body5TextStyle.copyWith(
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
