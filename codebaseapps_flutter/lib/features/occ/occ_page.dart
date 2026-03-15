import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../shared/cards.dart';

class OccPage extends StatelessWidget {
  const OccPage({super.key});

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
            // Simple back navigation for sub-pages
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

  Widget _buildSubNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111827).withAlpha(200),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
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
            _desktopNav(context),
          ],
        ),
      ),
    );
  }

  Widget _desktopNav(BuildContext context) {
    return Row(
      children: [
        _navLink('Home', () => context.go('/')),
        const SizedBox(width: 24),
        _navLink('About', () => context.go('/')),
        const SizedBox(width: 24),
        _navLink('Apps', null),
      ],
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
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, size: 20),
              label: const Text('Download for iOS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
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
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, size: 20),
              label: const Text('Download for Android'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2563EB),
                side: const BorderSide(color: Color(0xFF2563EB)),
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
      ],
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
