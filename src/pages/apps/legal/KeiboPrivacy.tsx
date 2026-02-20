import LegalPageTemplate, { LegalPageTheme } from "@/components/LegalPageTemplate";

// 🎨 KEIBO THEME - Change colors here to customize Keibo's legal pages
const keiboTheme: LegalPageTheme = {
  primaryColor: "#9333ea",      // Keibo purple
  primaryColorRGB: "147, 51, 234"
};

const KeiboPrivacy = () => {
  return (
    <LegalPageTemplate
      appName="Keibo"
      title="Privacy Policy"
      lastUpdated="February 21, 2026"
      backTo="/keibo"
      theme={keiboTheme}
    >
      {/* Introduction */}
      <section>
        <h2>Introduction</h2>
        <p>Codebase Apps ("we", "our", or "us") operates the Keibo mobile application (the "Service"). This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.</p>
      </section>

      {/* Information We Collect */}
      <section>
        <h2>Information We Collect</h2>
        <p>We collect information to provide better services to our users. This includes: Account information (email address), Usage data (app interactions, preferences), Device information (device type, operating system), Authentication data from third-party providers (Google, Apple).</p>
      </section>

      {/* How We Use Your Information */}
      <section>
        <h2>How We Use Your Information</h2>
        <p>We use the collected information for: Providing and maintaining our Service, Authenticating users, Personalizing user experience, Analyzing usage patterns to improve the Service, Communicating with users about updates or issues.</p>
      </section>

      {/* Information Sharing */}
      <section>
        <h2>Information Sharing</h2>
        <p>We do not sell, trade, or otherwise transfer your personal information to third parties. We may share information only in these circumstances: With your explicit consent, To comply with legal obligations, To protect our rights and safety.</p>
      </section>

      {/* Data Security */}
      <section>
        <h2>Data Security</h2>
        <p>We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.</p>
      </section>

      {/* Third-Party Services */}
      <section>
        <h2>Third-Party Services</h2>
        <p>Our Service may contain links to third-party services. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>
      </section>

      {/* Children's Privacy */}
      <section>
        <h2>Children's Privacy</h2>
        <p>Our Service is not intended for children under 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.</p>
      </section>

      {/* Your Data Rights */}
      <section>
        <h2>Your Data Rights</h2>
        <p>You have the right to: Access your personal data, Correct inaccurate data, Delete your data, Object to processing, Data portability. To exercise these rights, please contact us at the information provided below.</p>
      </section>

      {/* Changes to This Policy */}
      <section>
        <h2>Changes to This Policy</h2>
        <p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "last updated" date.</p>
      </section>

      {/* Contact Us */}
      <section>
        <h2>Contact Us</h2>
        <p>If you have any questions about this Privacy Policy, please contact Codebase Apps at: <a href="mailto:contact@codebaseapps.com">contact@codebaseapps.com</a></p>
      </section>

      {/* Footer */}
      <section 
        style={{ 
          backgroundColor: 'rgba(147, 51, 234, 0.05)',
          border: '1px solid rgba(147, 51, 234, 0.1)',
          borderRadius: '12px',
          padding: '24px',
          marginTop: '40px'
        }}
      >
        <h3 style={{ fontSize: '1.25rem', fontWeight: 600, marginBottom: '12px' }}>Questions or Concerns?</h3>
        <p>We are committed to protecting your privacy and ensuring transparency in our data practices. If you have any questions or concerns about how we handle your personal information, please don't hesitate to contact us.</p>
      </section>
    </LegalPageTemplate>
  );
};

export default KeiboPrivacy;
