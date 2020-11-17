import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie/common/config/build_config.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/common/utils/toolbar_stream.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/generated/l10n.dart';
import 'package:flutter_movie/page/splash/splash_router.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
const _sizeIcon = 16.0;
const _delayNotification = 4000;
const _durationAnimation = 1000;
const _defaultWidth = 500.0;
const _defaultHeight = 100.0;

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();

  static restartApp(BuildContext context) {
    final _ApplicationState state =
        context.findRootAncestorStateOfType<_ApplicationState>();
    state.restartApp();
  }

  static changeLanguage(BuildContext context, Locale locale) {
    final _ApplicationState state =
        context.findRootAncestorStateOfType<_ApplicationState>();
    state.changeLocale(locale);
  }

  static requireLogin() {
    final _ApplicationState state =
        navigatorKey.currentContext.findRootAncestorStateOfType<_ApplicationState>();
    // state.requireLogin();
  }
}

class _ApplicationState extends State<Application>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  AnimationController controller;
  Animation<double> animation;

  Locale _locale;
  String pushTitle;
  String pushText;
  bool isShowNotification = false;

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    // Set landscape orientation
    // SystemChrome.setPreferredOrientations(const [
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    controller = AnimationController(
        duration: const Duration(milliseconds: _durationAnimation), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 0.0).animate(controller);

    getIt<SessionsPref>().getLanguage().then((lang) {
      setState(() {
        if (lang == Constants.LANGUAGE_EN) {
          _locale = Locale(lang, 'EN');
        } else {
          _locale = Locale(lang, 'KR');
        }
      });
    });
    // _initializeFlutterFire();
    // _firebaseConfig();
  }

  @override
  void dispose() {
    controller.dispose();
    ToolbarStream.shared.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
        debugShowCheckedModeBanner: BuildConfig.isDevelopment(),
        navigatorKey: navigatorKey,
        key: key,
        theme: ThemeData(),
        locale: _locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: getIt<fluro.FluroRouter>().generator,
        initialRoute: SplashRouter.PATH_ROOT);
    return Container(
      child: app,
    );
  }

// requireLogin() {
//   showDialog(
//     context: navigatorKey.currentContext,
//     barrierDismissible: false,
//     builder: (context) {
//       return CupertinoAlertDialog(
//         content: Text(
//           S.of(navigatorKey.currentContext).session_expired,
//           style: CommonTextStyle.textStyleFontMontserratNormal,
//         ),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             onPressed: () {
//               SocketManager.shared.disconnect();
//               getIt<SessionsPref>().clearSession();
//               LoginRouter.launch(context);
//             },
//             child: Text(
//               S.of(navigatorKey.currentContext).ok,
//               style: CommonTextStyle.textStyleFontMontserratNormal,
//             ),
//           )
//         ],
//       );
//     },
//   );
// }
}
