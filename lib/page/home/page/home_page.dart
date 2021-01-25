import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/config/core/base_state.dart';
import 'package:flutter_movie/common/widgets/common_item_movie.dart';
import 'package:flutter_movie/common/widgets/common_loading.dart';
import 'package:flutter_movie/page/genre/page/genre_page.dart';
import 'package:flutter_movie/page/home/bloc/bloc.dart';
import 'package:flutter_movie/page/home/bloc/home_bloc.dart';
import 'package:flutter_movie/page/home/bloc/home_state.dart';
import 'package:flutter_movie/page/setting/page/setting_page.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';

const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _widgetOptions.add(MoviePage());
    _widgetOptions.add(GenrePage());
    _widgetOptions.add(SettingPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Genre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends BaseState<MoviePage> {
  List<Movie> _listNowPlaying = [];
  List<Movie> _listPopular = [];
  List<Movie> _listTopRated = [];
  List<Movie> _listUpcoming = [];

  HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read();
    bloc.add(HomeRequestListNowPlaying());
    bloc.add(HomeRequestListPopular());
    bloc.add(HomeRequestListTopRate());
    bloc.add(HomeRequestListUpcoming());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        switch (state.status) {
          case HomeStatus.NOTHING:
            break;
          case HomeStatus.LOADING:
            break;
          case HomeStatus.NOW_PLAYING_SUCCESS:
            _listNowPlaying = state?.listNowPlaying ?? [];
            break;
          case HomeStatus.POPULAR_SUCCESS:
            _listPopular = state?.listPopular ?? [];
            break;
          case HomeStatus.TOP_RATE_SUCCESS:
            _listTopRated = state?.listTopRate ?? [];
            break;
          case HomeStatus.UPCOMING_SUCCESS:
            _listUpcoming = state?.listUpcoming ?? [];
            break;
          case HomeStatus.ERROR:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state.status == HomeStatus.LOADING ? _loading() : _body(),
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80.0,
            margin: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'MOVIES',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          itemMovies(_listPopular, 'Popular'),
          itemMovies(_listNowPlaying, 'Now Playing'),
          itemMovies(_listTopRated, 'Top rated'),
          itemMovies(_listUpcoming, 'UpComing'),
        ],
      ),
    );
  }

  Widget itemMovies(List<Movie> list, String title) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 24.0, bottom: 16.0),
              child: Text(
                title,
                style: TextStyle(),
              )),
          Container(
            height: 250.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24.0),
              itemCount: list == null ? 0 : list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CommonItemMovie(
                  imageUrl: list[index].posterPath,
                  title: list[index].title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
