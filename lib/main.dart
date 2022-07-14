import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/article_category_cubit.dart';
import 'package:nubie_investor/cubit/article_cubit.dart';
import 'package:nubie_investor/cubit/bottom_navigation_cubit.dart';
import 'package:nubie_investor/cubit/favorite_article_cubit.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/pages/favorite_page.dart';
import 'package:nubie_investor/pages/home_page.dart';
import 'package:nubie_investor/pages/profile_page.dart';
import 'package:nubie_investor/theme.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => BottomNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => ArticleCubit(),
          ),
          BlocProvider(
            create: (context) => ArticleCategoryCubit(),
          ),
          BlocProvider(
            create: (create) => FavoriteArticleCubit(),
          ),
        ],
        child: const NubieInvestorApp(),
      ),
    );

class NubieInvestorApp extends StatelessWidget {
  const NubieInvestorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: (state is ThemeDark) ? dark : light,
          home: const HomePage(),
          routes: {
            '/homepage': (context) => const HomePage(),
            '/favorite-article': (context) => const FavoritePage(),
            '/profile': (context) => const ProfilePage(),
          },
        );
      },
    );
  }
}
