import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../shared/cards.dart';
import '../../shared/navigation.dart';
import '../../shared/platform_utils.dart';
import '../../shared/smart_app_banner.dart';

const _occAppStoreId = '6752423378';
const _occAppStoreUrl = 'https://apps.apple.com/app/id$_occAppStoreId';
const _occPlayStoreUrl =
    'https://play.google.com/store/apps/details?id=com.codebaseapps.occ';

class OccPage extends StatefulWidget {
  const OccPage({super.key});

  @override
  State<OccPage> createState() => _OccPageState();
}

class _OccPageState extends State<OccPage> {
  @override
  void initState() {
    super.initState();
    SmartAppBanner.show(appId: _occAppStoreId);
  }

  @override
  void dispose() {
    SmartAppBanner.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF111827), Color(0xFF172554), Color(0xFF111827)],
          ),
        ),
        child: Column(
          children: [
            const AppNavigation(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Column(
                      children: [
                        _buildHero(context),
                        const SizedBox(height: 48),
                        _buildFeatures(context),
                        const SizedBox(height: 48),
                        _buildLegalSection(context),
                        const SizedBox(height: 48),
                        _buildContactSection(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.occBlue, AppColors.occPurple],
          ).createShader(bounds),
          child: const Text(
            'OCC App',
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Your reliable companion for productivity and organization',
          style: TextStyle(fontSize: 20, color: Color(0xFFD1D5DB)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildDownloadButtons(),
      ],
    );
  }

  Widget _buildDownloadButtons() {
    final platform = PlatformUtils.current;

    if (platform == UserPlatform.ios) {
      return _storeButton(
        label: 'Download on the App Store',
        icon: Icons.apple,
        url: _occAppStoreUrl,
        filled: true,
      );
    }

    if (platform == UserPlatform.android) {
      return _storeButton(
        label: 'Get it on Google Play',
        icon: Icons.play_arrow,
        url: _occPlayStoreUrl,
        filled: true,
      );
    }

    // Desktop: show both
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _storeButton(
          label: 'Download for iOS',
          icon: Icons.apple,
          url: _occAppStoreUrl,
          filled: true,
        ),
        _storeButton(
          label: 'Download for Android',
          icon: Icons.play_arrow,
          url: _occPlayStoreUrl,
          filled: false,
        ),
      ],
    );
  }

  Widget _storeButton({
    required String label,
    required IconData icon,
    required String url,
    required bool filled,
  }) {
    Future<void> onTap() async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }

    if (filled) {
      return ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF2563EB),
        side: const BorderSide(color: Color(0xFF2563EB)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final features = [
      _F(
        Icons.shield_outlined,
        'Secure & Private',
        'Your data is encrypted and stays private. We never share your information.',
      ),
      _F(
        Icons.description_outlined,
        'Easy to Use',
        'Simple, intuitive interface designed for everyone.',
      ),
      _F(
        Icons.check_circle_outline,
        'Reliable',
        'Built with modern technology for consistent performance.',
      ),
    ];

    if (screenWidth >= 768) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: features
            .map(
              (f) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FeatureCard(
                    icon: f.icon,
                    title: f.title,
                    description: f.desc,
                    bgColor: const Color(0xFF1F2937).withAlpha(128),
                    borderColor: const Color(0xFF374151),
                    iconColor: AppColors.occBlue,
                    iconBgColor: AppColors.occBlue.withAlpha(51),
                    titleColor: Colors.white,
                    descColor: const Color(0xFF9CA3AF),
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
    return Column(
      children: features
          .map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FeatureCard(
                icon: f.icon,
                title: f.title,
                description: f.desc,
                bgColor: const Color(0xFF1F2937).withAlpha(128),
                borderColor: const Color(0xFF374151),
                iconColor: AppColors.occBlue,
                iconBgColor: AppColors.occBlue.withAlpha(51),
                titleColor: Colors.white,
                descColor: const Color(0xFF9CA3AF),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withAlpha(128),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF374151)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Legal & Support',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Review our terms, privacy policy, and support resources',
            style: TextStyle(color: Color(0xFF9CA3AF)),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 400) {
                return Row(
                  children: [
                    Expanded(
                      child: _legalButton(
                        context,
                        'Privacy Policy',
                        '/occ/privacy',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _legalButton(
                        context,
                        'Terms of Service',
                        '/occ/terms',
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  _legalButton(context, 'Privacy Policy', '/occ/privacy'),
                  const SizedBox(height: 12),
                  _legalButton(context, 'Terms of Service', '/occ/terms'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _legalButton(BuildContext context, String label, String path) {
    return OutlinedButton.icon(
      onPressed: () => context.go(path),
      icon: const Icon(Icons.description_outlined, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Color(0xFF4B5563)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Column(
        children: [
          const Text(
            'Need Help?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Our support team is here to assist you',
            style: TextStyle(color: Color(0xFFD1D5DB)),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFD1D5DB),
              side: const BorderSide(color: Color(0xFF4B5563)),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }
}

class _F {
  final IconData icon;
  final String title;
  final String desc;
  _F(this.icon, this.title, this.desc);
}
