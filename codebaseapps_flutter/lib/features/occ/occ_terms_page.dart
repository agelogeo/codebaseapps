import 'package:flutter/material.dart';
import '../../shared/legal_page_template.dart';

class OccTermsPage extends StatelessWidget {
  const OccTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LegalPageTemplate(
      appName: 'OCC',
      title: 'Terms of Service',
      lastUpdated: 'September 2025',
      backTo: '/occ',
      primaryColor: const Color(0xFF2F66F6),
      sections: const [
        LegalSection(
          title: 'Acceptance of Terms',
          paragraphs: [
            'By accessing and using the OCC mobile application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
          ],
        ),
        LegalSection(
          title: 'Description of Service',
          paragraphs: [
            'OCC is a mobile application developed by Codebase Apps that provides users with personal productivity and organizational tools. The specific features and functionality may be updated from time to time at our discretion.',
          ],
        ),
        LegalSection(
          title: 'User Accounts',
          paragraphs: [
            'To access certain features of the Service, you may be required to create an account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
          ],
        ),
        LegalSection(
          title: 'Acceptable Use',
          paragraphs: [
            'You agree to use the Service only for lawful purposes and in accordance with these Terms. You agree not to: Use the Service in any way that violates applicable laws, Interfere with or disrupt the Service, Attempt to gain unauthorized access to the Service.',
          ],
        ),
        LegalSection(
          title: 'Intellectual Property',
          paragraphs: [
            'The Service and its original content, features, and functionality are and will remain the exclusive property of Codebase Apps and its licensors. The Service is protected by copyright, trademark, and other laws.',
          ],
        ),
        LegalSection(
          title: 'Privacy and Data Protection',
          paragraphs: [
            'Your privacy is important to us. Please review our Privacy Policy, which also governs your use of the Service, to understand our practices regarding the collection and use of your information.',
          ],
        ),
        LegalSection(
          title: 'Disclaimers',
          paragraphs: [
            'The Service is provided "as is" and "as available" without any warranties of any kind. We disclaim all warranties, whether express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.',
          ],
        ),
        LegalSection(
          title: 'Limitation of Liability',
          paragraphs: [
            'In no event shall Codebase Apps be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.',
          ],
        ),
        LegalSection(
          title: 'Indemnification',
          paragraphs: [
            "You agree to defend, indemnify, and hold harmless Codebase Apps from and against any claims, damages, obligations, losses, liabilities, costs or debt, and expenses (including but not limited to attorney's fees).",
          ],
        ),
        LegalSection(
          title: 'Termination',
          paragraphs: [
            'We may terminate or suspend your account and access to the Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
          ],
        ),
        LegalSection(
          title: 'Changes to Terms',
          paragraphs: [
            'We reserve the right to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days notice prior to any new terms taking effect.',
          ],
        ),
        LegalSection(
          title: 'Governing Law',
          paragraphs: [
            'These Terms shall be interpreted and governed by the laws of the jurisdiction in which Codebase Apps operates, without regard to its conflict of law provisions.',
          ],
        ),
        LegalSection(
          title: 'Contact Information',
          paragraphs: [
            'If you have any questions about these Terms of Service, please contact Codebase Apps at: contact@codebaseapps.com',
          ],
        ),
      ],
      footerTitle: 'Agreement',
      footerText:
          'By using the OCC application, you acknowledge that you have read and understood these Terms of Service and agree to be bound by them.',
    );
  }
}
