import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {

  final Widget child;
  final Color background;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final Function onTap;
  final Widget text;
  final double width;
  final double height;
  final List<BoxShadow> boxShadow;

  TextButton({this.child, this.text, this.background, this.padding, this.margin, this.borderRadius, this.onTap, this.width, this.height, this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child: this.child ?? Container(
        width: this.width ?? 100,
        height: this.height ?? 40,
        padding: this.padding ?? EdgeInsets.zero,
        margin: this.margin ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: this.borderRadius ?? BorderRadius.zero,
          boxShadow: this.boxShadow ?? [],
          color: this.background ?? Colors.transparent
        ),
        child: this.text
      )
    );
  }
}