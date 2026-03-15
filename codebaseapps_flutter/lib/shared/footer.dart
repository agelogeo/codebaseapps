import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBg,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 20 : 28,
      ),
      child: isMobile
          ? Column(
              children: [
                _emailLink(),
                const SizedBox(height: 16),
                _socialLinks(),
                const SizedBox(height: 16),
                _copyright(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_emailLink(), _socialLinks(), _copyright()],
            ),
    );
  }

  Widget _emailLink() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl('mailto:codebaseapps@gmail.com'),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.email_outlined,
              size: 16,
              color: AppColors.mutedForeground,
            ),
            SizedBox(width: 8),
            Text(
              'codebaseapps@gmail.com',
              style: TextStyle(fontSize: 14, color: AppColors.mutedForeground),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(Icons.flutter_dash, 'https://twitter.com/codebaseapps'),
        const SizedBox(width: 16),
        _socialIcon(
          Icons.camera_alt_outlined,
          'https://instagram.com/codebaseapps',
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Icon(icon, size: 20, color: AppColors.mutedForeground),
      ),
    );
  }

  Widget _copyright() {
    return const Text(
      'Copyright 2025 © Codebase Apps',
      style: TextStyle(fontSize: 12, color: AppColors.mutedForeground),
    );
  }
}
