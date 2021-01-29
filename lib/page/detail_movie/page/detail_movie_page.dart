import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/config/core/base_state.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/common/utils/images.dart';
import 'package:flutter_movie/common/widgets/common_item_movie.dart';
import 'package:flutter_movie/common/widgets/common_loading.dart';
import 'package:flutter_movie/common/widgets/custom_cached_network_image.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_event.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_state.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';
import 'package:flutter_movie/repository/model/entity/production_company.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

final titleStyle = CommonTextStyle.textStyleFontQuicksand
    .copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.0);

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key key, this.movie}) : super(key: key);
  final Movie movie;

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends BaseState<DetailMoviePage> {
  DetailMovieBloc bloc;
  Movie _movie;
  List<ProductionCompany> listProductionCompanies;

  @override
  void initState() {
    _movie = widget.movie;
    bloc = context.read();
    bloc.add(DetailMovieStarted(widget.movie.id.toString()));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<DetailMovieBloc, DetailMovieState>(
      listener: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.NOTHING:
            // TODO: Handle this case.
            break;
          case DetailMovieStatus.LOADING:
            // TODO: Handle this case.
            break;
          case DetailMovieStatus.SUCCESS:
            _movie = state?.movie;
            listProductionCompanies = state?.movie?.productionCompanies;
            break;
          case DetailMovieStatus.ERROR:
            // TODO: Handle this case.
            break;
          case DetailMovieStatus.FINISH:
            // TODO: Handle this case.
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: mColorBackGroundPage,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            shadowColor: Colors.white.withOpacity(0),
            leading: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.chevron_left,
                size: 28.0,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.ios_share),
              ),
            ],
          ),
          body: state.status == DetailMovieStatus.LOADING ? _loading() : _body(width, height),
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

  Widget _body(double width, double height) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ///header
            Container(
              height: 420.0,
              child: Stack(
                children: [
                  ///cover image
                  Positioned(
                    child: Container(
                      height: 300.0,
                      child: CustomCachedNetworkImage(
                        imageUrl: Constants.IMAGE_URL + _movie?.backdropPath?.toString() ?? '',
                        widthImage: width,
                        widthPlaceholder: width,
                        paddingPlaceholder: 0,
                        errorWidget: Image.asset(
                          mImgPlaceHolder,
                          width: width,
                          fit: BoxFit.fill,
                        ),
                        placeholderWidget: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          child: const CommonLoading(
                            type: LoadingType.CIRCLE,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///content
                  Positioned(
                    top: 300.0,
                    left: 0.0,
                    child: Container(
                      margin: EdgeInsets.only(left: 170, top: 14.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Action, Adventure, Fantasy',
                                  style: titleStyle,
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  '2600 people are watching',
                                  style: titleStyle,
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  'Marvel Studios, Jason Roberts Productions, South Pictures',
                                  maxLines: 2,
                                  style: titleStyle,
                                ),
                                SizedBox(height: 6.0),
                                Row(
                                  children: [
                                    Text(
                                      _movie?.voteAverage.toString() ?? '',
                                      style: TextStyle(color: Colors.pink),
                                    ),
                                    RatingBarIndicator(
                                      rating:
                                          _movie.voteAverage != null ? _movie.voteAverage / 2 : 0,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.pink,
                                      ),
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      unratedColor: Colors.black26,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Icon(
                                Icons.stars,
                                color: Colors.limeAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///image poster
                  Positioned(
                    top: 250.0,
                    left: 30.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CustomCachedNetworkImage(
                        imageUrl: Constants.IMAGE_URL + _movie.posterPath,
                        widthImage: 120.0,
                        heightImage: 160.0,
                        widthPlaceholder: 120.0,
                        heightPlaceholder: 150.0,
                        paddingPlaceholder: 0,
                        errorWidget: Image.asset(
                          mImgSplash,
                          width: 120.0,
                          height: 160.0,
                          fit: BoxFit.fill,
                        ),
                        placeholderWidget: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          child: const CommonLoading(
                            type: LoadingType.CIRCLE,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 125,
                    left: 165,
                    child: Container(
                      width: width - 165.0,
                      child: Text(
                        _movie?.originalTitle ?? '',
                        maxLines: 2,
                        style: titleStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 00.0),
                              blurRadius: 3.0,
                              color: Colors.black,
                            ),
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 8.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///footer
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///overview
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: titleStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 14.0),
                        ReadMoreText(
                          _movie.overview,
                          trimLines: 4,
                          colorClickableText: Colors.black45,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'show more',
                          trimExpandedText: 'show less',
                          moreStyle: TextStyle(fontSize: 14, color: Colors.black45),
                        )
                      ],
                    ),
                  ),

                  ///Cast & Character
                  Container(
                    margin: EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cast & Character',
                          style: titleStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          height: 250.0,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // _getDetail(list[index]);
                                },
                                child: CommonItemMovie(
                                  imageUrl: 'list[index].posterPath',
                                  title: 'Character',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Production',
                          style: titleStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          height: 250.0,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: listProductionCompanies != null
                                ? listProductionCompanies.length
                                : 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // _getDetail(list[index]);
                                },
                                child: CommonItemMovie(
                                  imageUrl: listProductionCompanies[index].logoPath != null
                                      ? listProductionCompanies[index].logoPath
                                      : '',
                                  title: listProductionCompanies[index].name,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
