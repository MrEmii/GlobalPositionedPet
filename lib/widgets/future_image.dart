import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class FutureImage extends StatefulWidget{

  final String imageUrl;
  final Widget placeholder;
  final Widget error;
  final String errorImg;
  final bool useOldImageOnUrlChange;

  final Widget Function(ExtendedImageState) widgetBuilder;

  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  FutureImage({
    @required this.imageUrl,
    this.placeholder,
    this.error,
    this.errorImg,
    this.widgetBuilder,
    this.useOldImageOnUrlChange = true,
    this.width = 0,
    this.height = 0,
    this.fit = BoxFit.cover,
    this.borderRadius
  });

  @override
  _FutureImageState createState() => _FutureImageState();
}

class _FutureImageState extends State<FutureImage>{

  @override
  Widget build(BuildContext context) {

    var url = "http://190.105.90.55:3000/img/${widget.imageUrl}";

    var errorWidget = Container(
      width: this.widget.width,
      height: this.widget.height,
      child: this.widget.errorImg != null ? ExtendedImage.asset(this.widget.errorImg, width: this.widget.width, height: this.widget.height, fit: this.widget.fit) : this.widget.error,
    );

    Widget formatWidget = (this.widget.imageUrl != null && this.widget.imageUrl != "no-file") ? ExtendedImage.network(url,
      enableMemoryCache: false,
      loadStateChanged: this.widget.widgetBuilder != null ? this.widget.widgetBuilder : (ExtendedImageState state) {
        switch(state.extendedImageLoadState){
          case LoadState.loading: {
            return this.widget.placeholder;
          }

          case LoadState.completed: {
            return ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: this.widget.width,
                height: this.widget.height,
                fit: this.widget.fit,
              ),
            );
          }

          case LoadState.failed: {
            return errorWidget;
          }

          default: {
            return null;
          }
        }
      },
    ) : errorWidget;

    return formatWidget;
  }
}