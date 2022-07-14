class ArticleCategoryModel {
  final int id;
  final String name;
  final int count;

  ArticleCategoryModel(
      {required this.id, required this.name, required this.count});

  factory ArticleCategoryModel.fromJson(Map<String, dynamic> json) =>
      ArticleCategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        count: json['count'] as int,
      );
}
