import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeRequestListNowPlaying extends HomeEvent {}

class HomeRequestListPopular extends HomeEvent {}

class HomeRequestListTopRate extends HomeEvent {}

class HomeRequestListUpcoming extends HomeEvent {}