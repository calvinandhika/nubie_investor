import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationHome());

  void selectPage(int index) {
    if (index == 0) emit(BottomNavigationHome());
    if (index == 1) emit(BottomNavigationFavorite());
    if (index == 2) emit(BottomNavigationProfile());
  }
}
