import 'package:flutter_movie/common/config/core/base_bloc.dart';
import 'package:flutter_movie/page/home/bloc/bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}