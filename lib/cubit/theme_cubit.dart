import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nubie_investor/service/theme_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());

  void fetchTheme() async {
    String? theme = await ThemeService().fetchTheme();
    if (theme == 'light') {
      emit(ThemeLight());
    } else {
      emit(ThemeDark());
    }
  }

  void toggleTheme() {
    ThemeService().toggleTheme();
    if (state is ThemeDark) {
      emit(ThemeLight());
    } else {
      emit(ThemeDark());
    }
  }

  get currentTheme => state;
}
