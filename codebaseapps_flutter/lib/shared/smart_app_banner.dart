import 'dart:js_interop';
import 'package:web/web.dart' as web;

/// Manages the iOS Smart App Banner meta tag dynamically.
/// When a user visits a product page on iOS Safari, this shows the native
/// "OPEN" / "VIEW" banner at the top — the same prompt shown when scanning
/// QR codes or visiting Universal Links.
class SmartAppBanner {
  static web.HTMLMetaElement? _metaElement;

  /// Show the iOS Smart App Banner for a given App Store ID.
  /// [appId] is the numeric App Store ID (e.g. "123456789").
  /// [appArgument] optional URL passed to the app on open.
  static void show({required String appId, String? appArgument}) {
    remove();
    final meta = web.document.createElement('meta') as web.HTMLMetaElement;
    meta.name = 'apple-itunes-app';
    var content = 'app-id=$appId';
    if (appArgument != null) {
      content += ', app-argument=$appArgument';
    }
    meta.content = content;
    web.document.head?.appendChild(meta);
    _metaElement = meta;
  }

  /// Remove the Smart App Banner meta tag.
  static void remove() {
    _metaElement?.remove();
    _metaElement = null;
  }
}
