import 'package:flutter_movie/common/net/net.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'di_module.dart';

class NetModule extends DIModule{

  @override
  provides() async {
    final dio = await NetUtils.setup();
    print('URL : ${dio.options.baseUrl}');
    getIt.registerSingleton(dio);
  }
}