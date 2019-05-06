import 'package:flutter/material.dart';

class SysColors{
    static const int primaryValue = 0xFFFFFFFF;
    static const int primaryLightValue = 0xFF42464b;
    static const int primaryDarkValue = 0xFF121917;

    static const int white = 0xFFFFFFFF;
    
    static const int indicatorColor = 0xFFFFFFFF;
    static const int textColor = 0xFFFFFFFF;
    static const int boxBorderColor = 0xFFFFFFFF;

    static const MaterialColor primarySwatch = const MaterialColor(
      primaryValue,
      const <int, Color>{
        50: const Color(primaryLightValue),
        100: const Color(primaryLightValue),
        200: const Color(primaryLightValue),
        300: const Color(primaryLightValue),
        400: const Color(primaryLightValue),
        500: const Color(primaryValue),
        600: const Color(primaryDarkValue),
        700: const Color(primaryDarkValue),
        800: const Color(primaryDarkValue),
        900: const Color(primaryDarkValue),
      },
    );
}