import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/bottom_navigation_cubit.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/icon_navigation.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: Container(
        width: 300,
        height: 66,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            var navCubit = context.read<BottomNavigationCubit>();

            bool homeIsSelected = false,
                favoriteIsSelected = false,
                profileIsSelected = false;

            if (state is BottomNavigationHome) homeIsSelected = true;
            if (state is BottomNavigationFavorite) favoriteIsSelected = true;
            if (state is BottomNavigationProfile) profileIsSelected = true;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconNavigation(
                  title: 'Home',
                  navIcon: 'assets/icon_home.png',
                  onTap: () {
                    navCubit.selectPage(0);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homepage',
                      (route) => false,
                    );
                  },
                  isSelected: homeIsSelected,
                ),
                IconNavigation(
                  title: 'Favorite',
                  navIcon: 'assets/icon_favorite.png',
                  onTap: () {
                    navCubit.selectPage(1);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/favorite-article',
                      (route) => false,
                    );
                  },
                  isSelected: favoriteIsSelected,
                ),
                IconNavigation(
                  title: 'Profile',
                  navIcon: 'assets/icon_profile.png',
                  onTap: () {
                    navCubit.selectPage(2);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/profile',
                      (route) => false,
                    );
                  },
                  isSelected: profileIsSelected,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
