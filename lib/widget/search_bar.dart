import 'package:flutter/material.dart';
import 'package:nubie_investor/theme.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const SearchBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: TextField(
        readOnly: true,
        cursorColor: kBlueColor,
        controller: searchController,
        style: body4TextStyle,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: kBlueColor,
            ),
          ),
          isDense: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              onPressed: () {
                searchController.text = '';
              },
              icon: Icon(
                Icons.close,
                size: 25,
                color: kBlueColor,
              ),
            ),
          ),
          suffixIconColor: kBlueColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: kBlueColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
