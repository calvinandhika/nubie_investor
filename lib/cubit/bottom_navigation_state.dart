part of 'bottom_navigation_cubit.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationHome extends BottomNavigationState {}

class BottomNavigationFavorite extends BottomNavigationState {}

class BottomNavigationProfile extends BottomNavigationState {}
