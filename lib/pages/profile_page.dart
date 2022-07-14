import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/theme_cubit.dart';
import 'package:nubie_investor/theme.dart';
import 'package:nubie_investor/widget/shared/custom_app_bar.dart';
import 'package:nubie_investor/widget/shared/custom_bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            state: state,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Dark Mode',
                      style: body2TextStyle,
                    ),
                    trailing: Switch(
                      activeColor: kBlueColor,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      value: (state is ThemeDark) ? true : false,
                    ),
                  )
                ],
              ),
              const CustomBottomNavigationBar(),
            ],
          ),
        );
      },
    );
  }
}
