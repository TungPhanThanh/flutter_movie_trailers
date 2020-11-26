import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/config/core/base_state.dart';
import 'package:flutter_movie/common/widgets/common_loading.dart';
import 'package:flutter_movie/page/genre/bloc/genre_bloc.dart';
import 'package:flutter_movie/page/genre/bloc/genre_event.dart';
import 'package:flutter_movie/page/genre/bloc/genre_state.dart';
import 'package:flutter_movie/page/genre/page/widget/item_genre.dart';
import 'package:flutter_movie/repository/model/entity/genre.dart';

class GenrePage extends StatefulWidget {
  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends BaseState<GenrePage> {
  GenreBloc bloc;
  List<Genre> listGenre = [];
  Genre _genre;

  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    bloc = context.read();
    bloc.add(GenreRequest());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenreBloc, GenreState>(
      listener: (context, state) {
        switch (state.status) {
          case GenreStatus.NOTHING:
            break;
          case GenreStatus.LOADING:
            break;
          case GenreStatus.SUCCESS:
            break;
          case GenreStatus.ERROR:
            // TODO: Handle this case.
            break;
        }
      },
      builder: (context, state) {
        listGenre = state?.data?.genres;
        return Scaffold(
          body: state.status == GenreStatus.LOADING ? _loading() : _body(),
        );
      },
    );
  }

  Widget _loading() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: const CommonLoading(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('CATEGORIES')),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listGenre == null ? 0 : listGenre.length,
              controller: listScrollController,
              itemBuilder: (context, index) {
                return GenreItem(
                  genre: listGenre == null ? null : listGenre[index],
                  onClickGenre: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
