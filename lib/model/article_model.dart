import 'package:intl/intl.dart';

class ArticleModel {
  final int id;
  final String title;
  // ignore: non_constant_identifier_names
  final DateTime date_gmt;
  final String content;
  final List<dynamic> categories;
  final String description;
  final String url;

  ArticleModel({
    required this.id,
    required this.title,
    // ignore: non_constant_identifier_names
    required this.date_gmt,
    required this.content,
    required this.categories,
    required this.description,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    // content mesti di atur lagi pake html parser

    /* verify image url is not null */
    String url;
    String urlDefaultImage =
        'https://nubieinvestor.com/wp-content/uploads/2022/07/nubie-investor-default-background.jpg';

    var tempUrl = json["yoast_head_json"]['og_image'];
    if (tempUrl == null) {
      url = urlDefaultImage;
    } else {
      url = tempUrl[0]['url'];
    }
    /* verify image url is not null */

    /* verify DateFormat */
    DateTime date =
        DateFormat("yyyy-MM-ddThh:mm:ss").parse(json['date_gmt'] as String);
    /* verify DateFormat */

    /* HTML PARSER */

    /* HTML PARSER */

    return ArticleModel(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      date_gmt: date,
      content: json['content']['rendered'],
      categories: json['categories'] as List<dynamic>,
      description: json["yoast_head_json"]['description'] as String,
      url: url,
    );
  }
  // DateTime a =
  //     DateFormat("yyyy-MM-ddThh:mm:ss").parse('2021-08-16T17:06:53');
  // var b = DateFormat.yMMMEd().format(a);
}
