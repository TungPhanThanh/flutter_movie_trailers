import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/repository/model/response/get_list_genre_res.dart';

enum GenreStatus { NOTHING, LOADING, SUCCESS, ERROR }

class GenreState extends Equatable {
  final GenreStatus status;

  final GetListGenreRes data;

  final DioError dioError;

  const GenreState._({this.data, this.dioError, this.status = GenreStatus.NOTHING});

  const GenreState.nothing() : this._(status: GenreStatus.NOTHING);

  const GenreState.loading() : this._(status: GenreStatus.LOADING);

  const GenreState.success(GetListGenreRes data)
      : this._(status: GenreStatus.SUCCESS, data: data);

  const GenreState.error() : this._(status: GenreStatus.ERROR);

  @override
  List<Object> get props => [status, data];
}
