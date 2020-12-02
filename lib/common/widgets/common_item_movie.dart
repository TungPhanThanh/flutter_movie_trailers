import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_movie/common/widgets/custom_cached_network_image.dart';

class CommonItemMovie extends StatefulWidget {
  final String imageUrl;
  final String title;
  final Widget placeholderWidget;
  final Widget errorWidget;

  const CommonItemMovie({
    Key key,
    this.imageUrl,
    this.title,
    this.placeholderWidget,
    this.errorWidget,
  }) : super(key: key);

  @override
  _CommonItemMovieState createState() => _CommonItemMovieState();
}

class _CommonItemMovieState extends State<CommonItemMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomCachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500' + widget.imageUrl,
              widthImage: 120.0,
              heightImage: 200.0,
              heightPlaceholder: 200.0,
              widthPlaceholder:  120.0,
              errorWidget: Container(),
            ),
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
