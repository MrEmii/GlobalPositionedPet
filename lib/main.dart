import 'package:flutter/material.dart';
import 'package:gpp/providers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ProviderWrapper());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}
