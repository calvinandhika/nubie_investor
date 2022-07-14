import 'package:flutter/material.dart';
import 'package:nubie_investor/pages/custom_webview.dart';
import 'package:nubie_investor/theme.dart';

class SearchCard extends StatelessWidget {
  final String title;
  final String url;

  const SearchCard({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomWebview(url: url)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: h3TextStyle,
          ),
        ),
      ),
    );
  }
}
