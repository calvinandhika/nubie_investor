import 'package:flutter/material.dart';
import 'package:nubie_investor/pages/search_result_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query == '') {
            return close(context, null);
          }
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        return close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  void showResults(BuildContext context) {
    close(context, null);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultPage(
          query: query,
        ),
      ),
    );
    super.showResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Saham',
      'Warren Buffett',
      'Review Buku',
    ];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = suggestions[index];
          },
          title: Text(
            suggestions[index],
          ),
        );
      },
    );
  }
}
