import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  const CustomCachedNetworkImage({
    this.widthImage,
    this.heightImage,
    this.imageUrl,
    this.widthPlaceholder,
    this.heightPlaceholder,
    this.paddingPlaceholder,
    this.placeholderWidget,
    this.errorWidget,
    this.fit,
  });

  final double widthImage, heightImage;
  final String imageUrl;
  final double widthPlaceholder, heightPlaceholder, paddingPlaceholder;
  final Widget placeholderWidget;
  final Widget errorWidget;
  final BoxFit fit;

  @override
  _CustomCachedNetworkImageState createState() => _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: widget.fit ?? BoxFit.fill,
      width: widget.widthImage,
      height: widget.heightImage,
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => Container(
        padding: EdgeInsets.all(widget.paddingPlaceholder),
        width: widget.widthPlaceholder,
        height: widget.heightPlaceholder,
        child: widget.placeholderWidget,
      ),
      errorWidget: (context, url, error) => widget.errorWidget,
    );
  }
}
