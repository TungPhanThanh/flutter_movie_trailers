import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/utils/images.dart';
import 'package:flutter_movie/page/application.dart';
import 'package:flutter_movie/page/home/home_router.dart';

const _defaultRatioSizeToolbar = 0.1;

enum OptionMenu { MOVIE, GENRE, SETTING }

class CommonBottomBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CommonBottomBarState createState() => _CommonBottomBarState();

  @override
  Size get preferredSize => Size.fromHeight(getToolbar());

  double getToolbar() {
    final screenHeight = MediaQuery.of(navigatorKey.currentContext).size.height;
    return _defaultRatioSizeToolbar * screenHeight;
  }
}

class _CommonBottomBarState extends State<CommonBottomBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(navigatorKey.currentContext).size.height;
    return Container(
      height: _defaultRatioSizeToolbar * screenHeight,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _itemBottomBar(mIconMovie, 'Movies', OptionMenu.MOVIE),
          _itemBottomBar(mIconCategory, 'Categories', OptionMenu.GENRE),
          _itemBottomBar(mIconSetting, 'Settings', OptionMenu.SETTING),
        ],
      ),
    );
  }

  Widget _itemBottomBar(String icon, String text, OptionMenu type){
    return GestureDetector(
      onTap: () => _navigateToScreen(type),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 25.0,
              height: 25.0,
            ),
            Text(text, style: TextStyle(),)
          ],
        ),
      ),
    );
  }

  _navigateToScreen(type) {
    // Navigate to another screen
    switch (type) {
      case OptionMenu.MOVIE:
        final path = ModalRoute.of(context).settings.name;
        if (path.substring(0, path.length - 1) != HomeRouter.PATH) {
          HomeRouter.launch(context);
        }
        break;
      case OptionMenu.GENRE:
        final path = ModalRoute.of(context).settings.name;
        // if (path.substring(0, path.length - 1) != GenreRouter.PATH) {
        //   GenreRouter.launch(context);
        // }
        break;
      case OptionMenu.SETTING:
        final path = ModalRoute.of(context).settings.name;
        // if (path.substring(0, path.length - 1) != SettingsRouter.PATH) {
        //   SettingsRouter.launch(context);
        // }
        break;
    }
  }
}
