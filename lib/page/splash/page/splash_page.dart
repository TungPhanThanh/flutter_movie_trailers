import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/config/core/base_state.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/utils/images.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/splash/bloc/bloc.dart';

const logoWidth = 359.0;
const logoHeight = 126.0;
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
        print('vao day');
          // HomeRouter.launch(context);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: mColorSplashBackground,
          alignment: Alignment.center,
          child: Text('splash screen', style: TextStyle(color: Colors.white),)
        ),
      ),
    );
  }
}
