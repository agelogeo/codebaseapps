import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../shared/navigation.dart';
import '../../shared/footer.dart';
import '../../shared/cards.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppNavigation(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHero(context),
                  _buildFeatures(context),
                  _buildAboutSection(context),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      key: navScrollKeys['home'],
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Floating icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withAlpha(51)),
                  boxShadow: const [
                    BoxShadow(color: AppColors.glowColor, blurRadius: 40),
                  ],
                ),
                child: const Icon(
                  Icons.code,
                  size: 72,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Codebase Apps',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Building the future of software, one line of code at a time',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryForeground.withAlpha(230),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final features = [
      _FeatureData(
        Icons.auto_awesome,
        'Innovation',
        'Pushing boundaries with cutting-edge technology and creative solutions',
      ),
      _FeatureData(
        Icons.bolt,
        'Performance',
        'Lightning-fast applications optimized for the best user experience',
      ),
      _FeatureData(
        Icons.shield_outlined,
        'Security',
        'Enterprise-grade security measures to protect your valuable data',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: screenWidth >= 768
              ? Row(
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
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: features
                      .map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: FeatureCard(
                            icon: f.icon,
                            title: f.title,
                            description: f.desc,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      key: navScrollKeys['about'],
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Company Header
              InfoCard(
                headerTitle: 'Codebase Apps ΜΟΝ.Ι.Κ.Ε.',
                headerSubtitle: 'Μονοπρόσωπη Ιδιωτική Κεφαλαιουχική Εταιρία',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Our Mission',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'At Codebase Apps, we\'re dedicated to creating cutting-edge software solutions that empower businesses to thrive in the digital age. Our team of experienced developers and designers work together to deliver exceptional products that combine functionality with beautiful design.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedForeground,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Company Registration
              InfoCard(
                headerTitle: 'Company Registration',
                headerSubtitle: 'Official registration information',
                child: _buildRegistrationGrid(screenWidth),
              ),
              const SizedBox(height: 24),

              // Company Structure
              InfoCard(
                headerTitle: 'Company Structure',
                headerSubtitle: 'Management and ownership information',
                child: _buildCompanyStructure(screenWidth),
              ),
              const SizedBox(height: 24),

              // Quick Links
              _buildQuickLinks(screenWidth),
              const SizedBox(height: 24),

              // Annual Statements
              _buildAnnualStatements(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationGrid(double screenWidth) {
    final items = [
      _InfoItem('Address', 'Δημητρίου Γληνού 5Α\n546 28, Μενεμένη'),
      _InfoItem('Municipality', 'Μενεμένη - Αμπελοκήπων'),
      _InfoItem('Region', 'Θεσσαλονίκης'),
      _InfoItem('Tax ID (ΑΦΜ)', '801825022'),
      _InfoItem('Tax Office (ΔΟΥ)', 'Αμπελοκήπων'),
      _InfoItem('GEMI (Γ.Ε.Μ.Η.)', '164043006000'),
      _InfoItem('Foundation Date', '05/05/2022'),
      _InfoItem('Expiry Date', '05/05/2052'),
      _InfoItem('Share Capital', '3.000€'),
    ];

    if (screenWidth >= 640) {
      return Wrap(
        spacing: 24,
        runSpacing: 16,
        children: items.map((i) {
          return SizedBox(
            width: (screenWidth.clamp(0, 800) - 96) / 2,
            child: _infoTile(i.label, i.value),
          );
        }).toList(),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _infoTile(i.label, i.value),
            ),
          )
          .toList(),
    );
  }

  Widget _infoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.mutedForeground,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyStructure(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary.withAlpha(76),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withAlpha(128)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.people, size: 24, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Georgios Angelopoulos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const Text(
                  'ΔΙΑΧΕΙΡΙΣΤΗΣ (Manager)',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  children: [
                    _infoTile('Tax ID (ΑΦΜ)', '163753772'),
                    _infoTile('Start Date', '05/05/2022'),
                    _infoTile('Ownership', '100%'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinks(double screenWidth) {
    final links = [
      _QuickLink(Icons.business, 'Business Registry', 'GEMI: 164043006000'),
      _QuickLink(Icons.shield_outlined, 'Legal Status', 'Active since 2022'),
      _QuickLink(
        Icons.description_outlined,
        'Financial Reports',
        'View statements below',
      ),
    ];

    if (screenWidth >= 768) {
      return Row(
        children: links
            .map(
              (l) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _quickLinkCard(l),
                ),
              ),
            )
            .toList(),
      );
    }
    return Column(
      children: links
          .map(
            (l) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _quickLinkCard(l),
            ),
          )
          .toList(),
    );
  }

  Widget _quickLinkCard(_QuickLink link) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool hovering = false;
        return MouseRegion(
          onEnter: (_) => setState(() => hovering = true),
          onExit: (_) => setState(() => hovering = false),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBg.withAlpha(240),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border.withAlpha(128)),
              boxShadow: hovering
                  ? [
                      BoxShadow(
                        color: Colors.black.withAlpha(60),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withAlpha(30),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(link.icon, size: 32, color: AppColors.primary),
                ),
                const SizedBox(height: 12),
                Text(
                  link.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  link.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnnualStatements() {
    final statements = [
      _Statement(
        'Annual Financial Statement 2025',
        'March 2025',
        '532 KB',
        'statements/annual-2025.pdf',
      ),
      _Statement(
        'Annual Financial Statement 2022',
        'March 2022',
        '237 KB',
        'statements/annual-2022.pdf',
      ),
    ];

    return InfoCard(
      headerTitle: 'Annual Statements',
      headerSubtitle: 'Download yearly financial documents',
      child: Column(children: statements.map((s) => _statementRow(s)).toList()),
    );
  }

  Widget _statementRow(_Statement statement) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool hovering = false;
        return MouseRegion(
          onEnter: (_) => setState(() => hovering = true),
          onExit: (_) => setState(() => hovering = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hovering
                  ? AppColors.secondary
                  : AppColors.secondary.withAlpha(128),
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 500;
                if (isWide) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.description,
                          size: 24,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              statement.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.foreground,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                  color: AppColors.mutedForeground,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  statement.date,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mutedForeground,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  statement.size,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mutedForeground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _downloadButton(statement.path, statement.title),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.description,
                            size: 24,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                statement.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.foreground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 12,
                                    color: AppColors.mutedForeground,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    statement.date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    statement.size,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: _downloadButton(statement.path, statement.title),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _downloadButton(String path, String title) {
    return ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(path);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      icon: const Icon(Icons.download, size: 16),
      label: const Text('Download'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        textStyle: const TextStyle(fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _FeatureData {
  final IconData icon;
  final String title;
  final String desc;
  _FeatureData(this.icon, this.title, this.desc);
}

class _InfoItem {
  final String label;
  final String value;
  _InfoItem(this.label, this.value);
}

class _QuickLink {
  final IconData icon;
  final String title;
  final String subtitle;
  _QuickLink(this.icon, this.title, this.subtitle);
}

class _Statement {
  final String title;
  final String date;
  final String size;
  final String path;
  _Statement(this.title, this.date, this.size, this.path);
}
