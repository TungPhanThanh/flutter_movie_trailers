import 'package:flutter_movie/di/module/bloc_module.dart';
import 'package:flutter_movie/di/module/component_module.dart';
import 'package:flutter_movie/di/module/net_module.dart';
import 'package:flutter_movie/di/module/pref_module.dart';
import 'package:flutter_movie/di/module/repo_module.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static Future inject() async {
    await PrefModule().provides();
    await NetModule().provides();
    await RepoModule().provides();
    await BlocModule().provides();
    await ComponentModule().provides();
  }
}
