import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

enum HomeStatus {
  NOTHING,
  LOADING,
  SUCCESS,
  ERROR
}

class HomeState extends Equatable {

  final HomeStatus status;

  final DioError dioError;

  const HomeState._({this.status = HomeStatus.NOTHING, this.dioError,});

  const HomeState.nothing() : this._();

  const HomeState.loading() : this._(status: HomeStatus.LOADING);

  const HomeState.success() : this._();

  const HomeState.error() : this._();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}