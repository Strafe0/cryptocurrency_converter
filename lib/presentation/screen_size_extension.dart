import 'package:cryptocurrency_converter/logger.dart';
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  bool get isLargeScreen {
    try {
      double width = MediaQuery.sizeOf(this).width;
      return width >= 1200;
    } catch (e, s) {
      logger.d('Cannot to check screen type', error: e, stackTrace: s);
      return false;
    }
  }

  bool get isMediumScreen {
    try {
      double width = MediaQuery.sizeOf(this).width;
      return width >= 800 && width < 1200;
    } catch (e, s) {
      logger.d('Cannot to check screen type', error: e, stackTrace: s);
      return false;
    }
  }

  bool get isSmallScreen {
    try {
      double width = MediaQuery.sizeOf(this).width;
      return width < 800;
    } catch (e, s) {
      logger.d('Cannot to check screen type', error: e, stackTrace: s);
      return false;
    }
  }
}