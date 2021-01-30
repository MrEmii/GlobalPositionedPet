import 'package:flutter/material.dart';

class GPPColors{

  static Color backgroundBlack = Colors.black;

  static const Color facebookColor = Color(0xff3b5998);
  static const Color blackBlue90 = Color(0xff1C1B29);
  static const Color darkBlue84 = Color(0xff292841);
  static const Color black96 = Color(0xff080809);
  static const Color black94 = Color(0xff100E0E);
  static const Color white25 = Color(0xffBEBEBE);
  static const Color white07 = Color(0xffECECEC);
  static const Color black95 = Color(0xff100C0C);
  static const Color white18 = Color(0xffD1D1D1);
  static const Color white42 = Color(0xff939393);
  static const Color blue72 = Color(0xff47545D);
  static const Color blue90 = Color(0xff171C26);
  static const Color grey57 = Color(0xff6C7689);


  static Color green = Color(0xFF85E68F);
  static Color red = Color(0xffE68585);
  static Color red60 = Color(0x60E68585);

  static LinearGradient burningOrange = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [
      Color(0xFFFF416C),
      Color(0xFFFF4B2B),
    ]
  );

  static LinearGradient citrusPeel = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [
      Color(0xFFFDC830),
      Color(0xFFF37335),
    ]
  );

  static LinearGradient azurLane = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [
      Color(0xFF7F7FD5),
      Color(0xFF86A8E7),
      Color(0xFF91EAE4),
    ]
  );

  static LinearGradient blackToTransparent = LinearGradient(
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.5)
    ]
  );

   static LinearGradient gradientLove = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [
      Color(0xffFF9D9D),
      Color(0xFFBD569D),
    ]
  );

  static LinearGradient reflectGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end:   Alignment.centerRight,
    colors: [
      Colors.transparent,
      Colors.white,
    ]
  );

  static LinearGradient googleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.topRight,
    stops: [
       0.4,
      0.8,
      0.12,
      0.20
    ],
    colors: [
      Color(0xff2385F4),
      Color(0xff34A853),
      Color(0xfffbbc05),
      Color(0xffea4335),
    ]
  );

  static LinearGradient twitterGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.topRight,
    colors: [
      Color(0xff0084ba),
      Color(0xff08a0e9),
    ]
  );
}