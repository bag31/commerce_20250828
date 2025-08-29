import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScrollBehavior extends MaterialScrollBehavior{

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse, // mouse는 기본에 없음.
    PointerDeviceKind.touch,
  };


}