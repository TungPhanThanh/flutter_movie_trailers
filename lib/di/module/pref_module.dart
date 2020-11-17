import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';

class PrefModule extends DIModule{

  @override
  provides() async{
    getIt.registerSingleton(SessionsPref());
  }
}