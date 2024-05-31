import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color primaryBlack = Color(0xFF0B121C);
  static const Color greyScaffold = Color(0xFFEDF0EE);
  static const Color accentColor = Colors.white;

  static const Color textColor1 = Color(0xFFFFFFFF);
  static Color textColor2 = const Color(0xffffffff).withOpacity(0.56);
  static Color textColor3 = const Color(0xFF000718).withOpacity(0.5);
  static Color textColor4 = const Color(0xff000000);

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFF00845A,
    <int, Color>{
      100: Color(0xFF00845A),
      50: Color(0xFFF2FDF5),
    },
  );

  static BaseColor baseLight = BaseColor(
    0xFF16A249,
    <int, Color>{
      100: Colors.black,
      80: Colors.black.withOpacity(.8),
      60: Colors.black.withOpacity(.6),
      50: Colors.black.withOpacity(.5),
      40: Colors.black.withOpacity(.4),
      20: Colors.black.withOpacity(.2),
    },
  );

  static TextColor textColor = TextColor();
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade80 => this[80]!;

  Color get shade20 => this[20]!;

  Color get shade60 => this[60]!;
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;
}

class TextColor extends ColorSwatch<int> {
  TextColor()
      : super(
          0xFF332f2e,
          <int, Color>{
            1: const Color(0xFF000000),
            2: const Color(0xFF000000),
            3: const Color(0xFF000000),
            4: const Color(0xFF000000),
            5: const Color(0x0fffffff).withOpacity(0.56),
            6: const Color(0xFF000000),
          },
        );

  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
}