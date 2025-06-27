import 'package:flutter/material.dart';

class ScreensWidth {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;
}
