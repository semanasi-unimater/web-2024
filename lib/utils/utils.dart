import 'package:flutter/cupertino.dart';
import 'package:semanaacademica2024/enum/enum.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static double getResponsiveFontSize(double screenSize) {
    if (screenSize < 600) {
      return screenSize * 0.040;
    } else {
      double baseSize = 14;
      double scale = (screenSize - 600) / (1920 - 600);
      return baseSize + (scale * (24 - baseSize));
    }
  }

  static DeviceType getDeviceType(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return DeviceType.mobile;
    } else if (screenWidth >= 600 && screenWidth <= 800) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}
