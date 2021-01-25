import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/common/utils/images.dart';
import 'package:flutter_movie/common/widgets/common_loading.dart';
import 'package:flutter_movie/common/widgets/custom_cached_network_image.dart';
import 'package:flutter_movie/common/widgets/loading/circle.dart';

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
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CustomCachedNetworkImage(
              imageUrl: Constants.IMAGE_URL + widget.imageUrl,
              widthImage: 140.0,
              heightImage: 200.0,
              heightPlaceholder: 200.0,
              widthPlaceholder: 140.0,
              paddingPlaceholder: 0,
              errorWidget: Image.asset(
                mImgPlaceHolder,
                width: 140.0,
                height: 200.0,
              ),
              placeholderWidget: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: const CommonLoading(type: LoadingType.CIRCLE,),
              ),
            ),
          ),
          Container(
              width: 140.0,
              child: Text(
                widget.title,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
