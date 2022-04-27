import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Responsive {
  /// function responsible for providing value according to screen size
  getResponsiveValue(
      {dynamic forShortScreen,
      dynamic forMediumScreen,
      dynamic forLargeScreen,
      required BuildContext context}) {
    if (isLargeScreen(context)) {
      return forLargeScreen;
    } else if (isMediumScreen(context)) {
      return forMediumScreen;
    } else if (isSmallScreen(context)) {
      return forShortScreen;
    } else {
      return forShortScreen;
    }
  }

  isLandScapeMode(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLargeScreen(BuildContext context) {
    return getWidth(context) > 1024;
  }

  static bool isSmallScreen(BuildContext context) {
    return getWidth(context) < 768;
  }

  static bool isMediumScreen(BuildContext context) {
    return getWidth(context) > 768 && getWidth(context) < 1024;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;

  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
}

class Insets {
  static const double px_2 = 2;
  static const double px_4 = 4;
  static const double px_6 = 6;
  static const double px_8 = 8;
  static const double px_12 = 12;
  static const double px_16 = 16;
  static const double px_18 = 18;
  static const double px_24 = 24;
  static const double px_32 = 32;
  static const double px_36 = 36;
  static const double px_38 = 38;
  static const double px_40 = 40;
  static const double px_42 = 42;
  static const double px_48 = 48;
  static const double px_64 = 64;
  static const double px_72 = 72;
  static const double px_58 = 58;

  static const double width_58 = 58;
  static const double width_230 = 230;
  static const double width_300 = 300;
  static const double width_260 = 260;
  static const double width_360 = 360;
}

class Fonts {
  static const String raleWay = 'RaleWay';
}

class TextStyles {
  static TextStyle raleWay = const TextStyle(
    fontFamily: Fonts.raleWay,
    color: Colors.blue,
  );
  static TextStyle buttonText1 = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue);
  static TextStyle buttonText2 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 11);
  static TextStyle h1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.blue,
  );
  static TextStyle h2 = const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 16, color: Colors.blue);
  static TextStyle h3 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.blue,
  );
  static TextStyle footer = const TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  static late TextStyle body1 = raleWay.copyWith(color: Colors.blue);
}

class PageRoutes {
  static const String about = 'about';
  static const String submit = 'submit ';
  static const String link = 'link';
  static const String comment = 'comment';
  static const String detail = 'detail';
}
