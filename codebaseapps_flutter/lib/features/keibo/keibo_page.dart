import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../shared/cards.dart';

class KeiboPage extends StatelessWidget {
  const KeiboPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.keiboBg, AppColors.keiboCard, AppColors.keiboBg],
          ),
        ),
        child: Column(
          children: [
            _buildSubNav(context),
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
                        _buildBenefits(context),
                        const SizedBox(height: 48),
                        _buildLegalSection(context),
                        const SizedBox(height: 48),
                        _buildCTA(context),
                        const SizedBox(height: 48),
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

  Widget _buildSubNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.keiboBg.withAlpha(200),
        border: const Border(bottom: BorderSide(color: AppColors.keiboBorder)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.gradientEnd],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: AppColors.glowColor, blurRadius: 20),
                        ],
                      ),
                      child: const Icon(
                        Icons.code,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Codebase Apps',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                _navLink('Home', () => context.go('/')),
                const SizedBox(width: 24),
                _navLink('About', () => context.go('/')),
                const SizedBox(width: 24),
                _navLink('Apps', null),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navLink(String label, VoidCallback? onTap) {
    return MouseRegion(
      cursor: onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.keiboOrange.withAlpha(51),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            '✨ Now Available',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.keiboOrange,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.keiboOrange, AppColors.keiboBlue],
          ).createShader(bounds),
          child: const Text(
            'Welcome to Keibo',
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
          'The next generation app that simplifies your daily tasks and enhances your productivity.',
          style: TextStyle(fontSize: 20, color: AppColors.keiboText),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.apple, size: 20),
              label: const Text('Download for iOS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.keiboOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, size: 20),
              label: const Text('Download for Android'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.keiboBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Free to download • Available on all platforms',
          style: TextStyle(fontSize: 14, color: AppColors.keiboMuted),
        ),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final features = [
      _F(
        Icons.smartphone,
        'Mobile First',
        'Designed for your smartphone with a seamless experience on any device.',
      ),
      _F(
        Icons.lock_outline,
        'Secure by Default',
        'Bank-level encryption keeps your information safe and secure.',
      ),
      _F(
        Icons.bolt,
        'Lightning Fast',
        'Optimized performance for quick access and smooth interactions.',
      ),
      _F(
        Icons.people_outline,
        'Community Driven',
        'Join thousands of users and be part of our growing community.',
      ),
    ];

    if (screenWidth >= 900) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: features
            .map(
              (f) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FeatureCard(
                    icon: f.icon,
                    title: f.title,
                    description: f.desc,
                    bgColor: AppColors.keiboCard,
                    borderColor: AppColors.keiboBorder,
                    iconColor: AppColors.keiboOrange,
                    iconBgColor: AppColors.keiboOrange.withAlpha(51),
                    titleColor: AppColors.keiboText,
                    descColor: AppColors.keiboMuted,
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
    if (screenWidth >= 600) {
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: features
            .map(
              (f) => SizedBox(
                width: (screenWidth - 80) / 2,
                child: FeatureCard(
                  icon: f.icon,
                  title: f.title,
                  description: f.desc,
                  bgColor: AppColors.keiboCard,
                  borderColor: AppColors.keiboBorder,
                  iconColor: AppColors.keiboOrange,
                  iconBgColor: AppColors.keiboOrange.withAlpha(51),
                  titleColor: AppColors.keiboText,
                  descColor: AppColors.keiboMuted,
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
                bgColor: AppColors.keiboCard,
                borderColor: AppColors.keiboBorder,
                iconColor: AppColors.keiboOrange,
                iconBgColor: AppColors.keiboOrange.withAlpha(51),
                titleColor: AppColors.keiboText,
                descColor: AppColors.keiboMuted,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildBenefits(BuildContext context) {
    final benefits = [
      'Easy setup in minutes',
      'No credit card required',
      'Regular updates and improvements',
      '24/7 customer support',
      'Cross-platform compatibility',
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.keiboOrange, AppColors.keiboBlue],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Why Choose Keibo?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Everything you need to get started and succeed',
            style: TextStyle(fontSize: 16, color: Colors.white.withAlpha(200)),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 500) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: benefits
                      .map(
                        (b) => SizedBox(
                          width: (constraints.maxWidth - 16) / 2 - 1,
                          child: _benefitItem(b),
                        ),
                      )
                      .toList(),
                );
              }
              return Column(
                children: benefits
                    .map(
                      (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _benefitItem(b),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _benefitItem(String text) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(51),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.check, size: 16, color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.keiboCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.keiboBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Legal & Support',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.keiboText,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Review our terms, privacy policy, and support resources',
            style: TextStyle(color: AppColors.keiboMuted),
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
                        '/keibo/privacy',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _legalButton(
                        context,
                        'Terms of Service',
                        '/keibo/terms',
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  _legalButton(context, 'Privacy Policy', '/keibo/privacy'),
                  const SizedBox(height: 12),
                  _legalButton(context, 'Terms of Service', '/keibo/terms'),
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
        foregroundColor: AppColors.keiboText,
        side: const BorderSide(color: AppColors.keiboBorder),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildCTA(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.keiboCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.keiboBorder),
      ),
      child: Column(
        children: [
          const Text(
            'Ready to Get Started?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.keiboText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Download Keibo today and join our growing community',
            style: TextStyle(fontSize: 20, color: AppColors.keiboMuted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 20),
            label: const Text('Download Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.keiboOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No account required to start • Instant access',
            style: TextStyle(fontSize: 14, color: AppColors.keiboMuted),
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
