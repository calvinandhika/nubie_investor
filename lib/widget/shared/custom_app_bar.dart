import 'package:flutter/material.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/custom_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeState state;

  const CustomAppBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/homepage',
            (route) => false,
          );
        },
        child: Image.asset(
          (state is ThemeDark)
              ? 'assets/logo_nubie_investor_dark.png'
              : 'assets/logo_nubie_investor_light.png',
          width: 220,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          icon: Icon(
            Icons.search,
            color: (state is ThemeDark) ? kWhiteColor : kBlackColor,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
