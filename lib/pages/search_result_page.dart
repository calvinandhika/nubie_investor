import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/search_bar.dart';
import 'package:nubie_investor/widget/search_card.dart';
import 'package:nubie_investor/widget/shared/custom_app_bar.dart';
import 'package:nubie_investor/widget/shared/custom_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;

class SearchResultPage extends StatefulWidget {
  final String query;

  final TextEditingController searchController = TextEditingController();

  SearchResultPage({
    Key? key,
    required this.query,
  }) : super(key: key) {
    searchController.text = query;
  }

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isLoading = false;

  Future<List<dynamic>> fetchSearchResult() async {
    var url = Uri.https('nubieinvestor.com', '/wp-json/wp/v2/search', {
      'search': widget.query,
      'per_page': '100',
    });

    try {
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      var searchResults = result as List<dynamic>;
      return searchResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (ctx, themeState) {
        return Scaffold(
          appBar: CustomAppBar(
            state: themeState,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              ListView(
                children: [
                  SearchBar(searchController: widget.searchController),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Results found for \'${widget.searchController.text}\'',
                      style: body3TextStyle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder(
                    future: fetchSearchResult(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<dynamic> temp = snapshot.data as List<dynamic>;
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: temp.length,
                          itemBuilder: (context, index) {
                            return SearchCard(
                              title: temp[index]['title'],
                              url: temp[index]['url'],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
              // const CustomBottomNavigationBar(),
            ],
          ),
        );
      },
    );
  }
}
