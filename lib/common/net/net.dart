library net;

import 'dart:async';
import 'dart:io';

import 'package:flutter_movie/common/config/build_config.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'src/http_code.dart';
part 'src/http_overrides.dart';
part 'src/intercept/adapter_interceptor.dart';
part 'src/intercept/auth_interceptor.dart';
part 'src/net_utils.dart';