part of env;

class FlavorWidget extends StatelessWidget {
  const FlavorWidget(
      {this.child,
        this.resizeToAvoidBottomInset = true,
        this.resizeToAvoidBottomPadding = true,
        this.isUseSafeArea = true});

  final Widget child;
  final bool resizeToAvoidBottomInset, resizeToAvoidBottomPadding;
  final bool isUseSafeArea;

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
        backgroundColor: mColorBackground,
        body: _body(isUseSafeArea,child),
      ),
    );
  }

  _body(isUseSafeArea, child) => isUseSafeArea ? SafeArea(child: child) : child;
}