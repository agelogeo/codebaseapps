import 'package:web/web.dart' as web;

enum UserPlatform { ios, android, desktop }

class PlatformUtils {
  static UserPlatform? _cached;

  static UserPlatform get current {
    if (_cached != null) return _cached!;
    final ua = web.window.navigator.userAgent.toLowerCase();
    if (ua.contains('iphone') || ua.contains('ipad') || ua.contains('ipod')) {
      _cached = UserPlatform.ios;
    } else if (ua.contains('android')) {
      _cached = UserPlatform.android;
    } else {
      _cached = UserPlatform.desktop;
    }
    return _cached!;
  }

  static bool get isIOS => current == UserPlatform.ios;
  static bool get isAndroid => current == UserPlatform.android;
  static bool get isDesktop => current == UserPlatform.desktop;
  static bool get isMobile => isIOS || isAndroid;
}
