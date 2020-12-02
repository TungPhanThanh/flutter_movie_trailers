
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/widgets/loading/circle.dart';
import 'package:flutter_movie/common/widgets/loading/fading_circle.dart';
import 'package:flutter_movie/common/widgets/loading/three_bounce.dart';

const _sizeThreeBounce = 25.0;

enum LoadingType { THREE_BOUNCE, CIRCLE, FADING_CIRCLE }

class CommonLoading extends StatelessWidget {
  const CommonLoading({this.type});

  final LoadingType type;

  @override
  Widget build(BuildContext context) {
    Widget loading;
    switch (type) {
      case LoadingType.THREE_BOUNCE:
        loading = LoadingThreeBounce(
          color: mColorAccent,
          size: _sizeThreeBounce,
        );
        break;
      case LoadingType.CIRCLE:
        loading = LoadingCircle(color: mColorAccent);
        break;
      case LoadingType.FADING_CIRCLE:
        loading = LoadingFadingCircle(color: mColorAccent);
        break;
      default:
        loading = LoadingThreeBounce(
          color: mColorAccent,
          size: _sizeThreeBounce,
        );
        break;
    }
    return Center(
      child: loading,
    );
  }
}
