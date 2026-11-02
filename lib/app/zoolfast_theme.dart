import 'package:flutter/material.dart';

class ZoolFastTheme {
  static const yellow = Color(0xffffd700);
  static const black = Color(0xff000000);
  static const redPin = Color(0xffd62828);
  static const portSudan = LatLng(19.6158, 37.2164);
}

class LatLng {
  const LatLng(this.lat, this.lng);
  final double lat;
  final double lng;
}
