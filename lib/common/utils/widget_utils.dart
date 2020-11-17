import 'package:flutter/material.dart';
import 'package:flutter_movie/common/style/style.dart';

BoxDecoration radiusBody() {
  return const BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(mRadiusLarge),
        topRight: Radius.circular(mRadiusLarge)),
  );
}
