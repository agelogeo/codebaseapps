import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class LegalPageTemplate extends StatelessWidget {
  final String appName;
  final String title;
  final String lastUpdated;
  final String backTo;
  final Color primaryColor;
  final List<LegalSection> sections;
  final String? footerTitle;
  final String? footerText;

  const LegalPageTemplate({
    super.key,
    required this.appName,
    required this.title,
    required this.lastUpdated,
    required this.backTo,
    required this.primaryColor,
    required this.sections,
    this.footerTitle,
    this.footerText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 850 ? 800.0 : screenWidth - 32.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: contentWidth,
            margin: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(30),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.all(screenWidth > 600 ? 40 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context.go(backTo),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 16,
                            color: Color(0xFF6B7280),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Back to $appName',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Header
                Center(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Last updated: $lastUpdated',
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(height: 2, color: const Color(0xFFE5E7EB)),
                const SizedBox(height: 32),

                // Sections
                ...sections.map((section) => _buildSection(section)),

                // Highlighted footer section
                if (footerTitle != null && footerText != null)
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(13),
                      border: Border.all(color: primaryColor.withAlpha(25)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          footerTitle!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          footerText!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4B5563),
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Return button
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: primaryColor.withAlpha(13),
                    border: Border.all(color: primaryColor.withAlpha(25)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.go(backTo),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Return to $appName'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(LegalSection section) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
            ),
            child: Text(
              section.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...section.paragraphs.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildRichText(p),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(String text) {
    // Simple email link detection
    final emailRegex = RegExp(r'(\S+@\S+\.\S+)');
    final match = emailRegex.firstMatch(text);
    if (match != null) {
      final before = text.substring(0, match.start);
      final email = match.group(0)!;
      final after = text.substring(match.end);
      return RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF4A4A4A),
            height: 1.7,
          ),
          children: [
            TextSpan(text: before),
            TextSpan(
              text: email,
              style: TextStyle(
                color: primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: after),
          ],
        ),
      );
    }
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF4A4A4A),
        height: 1.7,
      ),
    );
  }
}

class LegalSection {
  final String title;
  final List<String> paragraphs;

  const LegalSection({required this.title, required this.paragraphs});
}
