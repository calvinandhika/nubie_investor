import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nubie_investor/model/article_category_model.dart';
import 'package:nubie_investor/model/article_model.dart';

class ArticleService {
  Future<List<ArticleModel>> fetchAllArticle() async {
    var url = Uri.https('nubieinvestor.com', '/wp-json/wp/v2/posts', {
      'order': 'desc',
      'per_page': '100',
      // 'categories': '79',
    });
    try {
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      var a = result as List<dynamic>;
      List<ArticleModel> articles =
          a.map((json) => ArticleModel.fromJson(json)).toList();

      return articles;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleCategoryModel>> fetchArticlesCategory() async {
    var url = Uri.https('nubieinvestor.com', 'wp-json/wp/v2/categories', {
      'orderby': 'count',
      'order': 'desc',
      'per_page': '100',
    });

    try {
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      var a = result as List<dynamic>;
      List<ArticleCategoryModel> articlesCategory =
          a.map((json) => ArticleCategoryModel.fromJson(json)).toList();

      return articlesCategory;
    } catch (e) {
      rethrow;
    }
  }
}
