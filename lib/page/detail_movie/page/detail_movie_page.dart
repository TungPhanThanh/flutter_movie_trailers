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
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_state.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';
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

  @override
  void initState() {
    bloc = context.read();
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
            // TODO: Handle this case.
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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300.0,
                    color: Colors.limeAccent,
                    child: CustomCachedNetworkImage(
                      imageUrl: Constants.IMAGE_URL + 'widget.imageUrl',
                      widthImage: width,
                      widthPlaceholder: width,
                      paddingPlaceholder: 0,
                      errorWidget: Image.asset(
                        mImgSplash,
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///content
                        Container(
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
                                          '9.8',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        RatingBarIndicator(
                                          rating: 8.8 / 2.0,
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
                                'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.',
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
