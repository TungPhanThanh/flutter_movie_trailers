import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/config/core/base_state.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/utils/images.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/home/home_router.dart';
import 'package:flutter_movie/page/splash/bloc/bloc.dart';

const delayLoadingSec = 1500;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage> {
  SplashBloc bloc = getIt<SplashBloc>();

  String version = '';

  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(milliseconds: delayLoadingSec), () {
          HomeRouter.launch(context);
      });
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            mImgSplash,
            fit: BoxFit.fill,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
