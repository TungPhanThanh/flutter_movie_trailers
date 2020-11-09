part of env;

const bannerSize = 50.0;

// ignore: must_be_immutable
class FlavorBanner extends StatelessWidget {
  FlavorBanner({@required this.child});

  final Widget child;
  BannerConfig bannerConfig;

  @override
  Widget build(BuildContext context) {
    if (BuildConfig.isRelease()) return child;
    bannerConfig ??= _getDefaultBanner();
    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: BuildConfig.flavorName(),
        bannerColor: BuildConfig.get().color);
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: bannerSize,
        height: bannerSize,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig.bannerColor),
        ),
      ),
      onLongPress: () {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return DeviceInfoDialog();
            });
      },
    );
  }
}

class BannerConfig {
  BannerConfig({@required this.bannerName, @required this.bannerColor});

  final String bannerName;
  final Color bannerColor;
}
