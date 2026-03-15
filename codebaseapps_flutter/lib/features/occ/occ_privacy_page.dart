import 'package:flutter/material.dart';
import '../../shared/legal_page_template.dart';

class OccPrivacyPage extends StatelessWidget {
  const OccPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LegalPageTemplate(
      appName: 'OCC',
      title: 'Privacy Policy',
      lastUpdated: 'September 2025',
      backTo: '/occ',
      primaryColor: const Color(0xFF2F66F6),
      sections: const [
        LegalSection(
          title: 'Introduction',
          paragraphs: [
            'Codebase Apps ("we", "our", or "us") operates the OCC mobile application (the "Service"). This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.',
          ],
        ),
        LegalSection(
          title: 'Information We Collect',
          paragraphs: [
            'We collect information to provide better services to our users. This includes: Account information (email address), Usage data (app interactions, preferences), Device information (device type, operating system), Authentication data from third-party providers (Google, Apple).',
          ],
        ),
        LegalSection(
          title: 'How We Use Your Information',
          paragraphs: [
            'We use the collected information for: Providing and maintaining our Service, Authenticating users, Personalizing user experience, Analyzing usage patterns to improve the Service, Communicating with users about updates or issues.',
          ],
        ),
        LegalSection(
          title: 'Information Sharing',
          paragraphs: [
            'We do not sell, trade, or otherwise transfer your personal information to third parties. We may share information only in these circumstances: With your explicit consent, To comply with legal obligations, To protect our rights and safety.',
          ],
        ),
        LegalSection(
          title: 'Data Security',
          paragraphs: [
            'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
          ],
        ),
        LegalSection(
          title: 'Third-Party Services',
          paragraphs: [
            'Our Service may contain links to third-party services. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
          ],
        ),
        LegalSection(
          title: "Children's Privacy",
          paragraphs: [
            'Our Service is not intended for children under 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.',
          ],
        ),
        LegalSection(
          title: 'Your Data Rights',
          paragraphs: [
            'You have the right to: Access your personal data, Correct inaccurate data, Delete your data, Object to processing, Data portability. To exercise these rights, please contact us at the information provided below.',
          ],
        ),
        LegalSection(
          title: 'Changes to This Policy',
          paragraphs: [
            'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "last updated" date.',
          ],
        ),
        LegalSection(
          title: 'Contact Us',
          paragraphs: [
            'If you have any questions about this Privacy Policy, please contact Codebase Apps at: contact@codebaseapps.com',
          ],
        ),
      ],
      footerTitle: 'Questions or Concerns?',
      footerText:
          'We are committed to protecting your privacy and ensuring transparency in our data practices. If you have any questions or concerns about how we handle your personal information, please don\'t hesitate to contact us.',
    );
  }
}
