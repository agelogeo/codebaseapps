import LegalPageTemplate, { LegalPageTheme } from "@/components/LegalPageTemplate";

// 🎨 OCC THEME - Change colors here to customize OCC's legal pages
const occTheme: LegalPageTheme = {
  primaryColor: "#2f66f6",      // OCC blue
  primaryColorRGB: "47, 102, 246"
};

const OCCTerms = () => {
  return (
    <LegalPageTemplate
      appName="OCC"
      title="Terms of Service"
      lastUpdated="September 2025"
      backTo="/occ"
      theme={occTheme}
    >
      {/* Acceptance of Terms */}
      <section>
        <h2>Acceptance of Terms</h2>
        <p>By accessing and using the OCC mobile application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.</p>
      </section>

      {/* Description of Service */}
      <section>
        <h2>Description of Service</h2>
        <p>OCC is a mobile application developed by Codebase Apps that provides users with personal productivity and organizational tools. The specific features and functionality may be updated from time to time at our discretion.</p>
      </section>

      {/* User Accounts */}
      <section>
        <h2>User Accounts</h2>
        <p>To access certain features of the Service, you may be required to create an account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>
      </section>

      {/* Acceptable Use */}
      <section>
        <h2>Acceptable Use</h2>
        <p>You agree to use the Service only for lawful purposes and in accordance with these Terms. You agree not to: Use the Service in any way that violates applicable laws, Interfere with or disrupt the Service, Attempt to gain unauthorized access to the Service.</p>
      </section>

      {/* Intellectual Property */}
      <section>
        <h2>Intellectual Property</h2>
        <p>The Service and its original content, features, and functionality are and will remain the exclusive property of Codebase Apps and its licensors. The Service is protected by copyright, trademark, and other laws.</p>
      </section>

      {/* Privacy and Data Protection */}
      <section>
        <h2>Privacy and Data Protection</h2>
        <p>Your privacy is important to us. Please review our Privacy Policy, which also governs your use of the Service, to understand our practices regarding the collection and use of your information.</p>
      </section>

      {/* Disclaimers */}
      <section>
        <h2>Disclaimers</h2>
        <p>The Service is provided "as is" and "as available" without any warranties of any kind. We disclaim all warranties, whether express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.</p>
      </section>

      {/* Limitation of Liability */}
      <section>
        <h2>Limitation of Liability</h2>
        <p>In no event shall Codebase Apps be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.</p>
      </section>

      {/* Indemnification */}
      <section>
        <h2>Indemnification</h2>
        <p>You agree to defend, indemnify, and hold harmless Codebase Apps from and against any claims, damages, obligations, losses, liabilities, costs or debt, and expenses (including but not limited to attorney's fees).</p>
      </section>

      {/* Termination */}
      <section>
        <h2>Termination</h2>
        <p>We may terminate or suspend your account and access to the Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>
      </section>

      {/* Changes to Terms */}
      <section>
        <h2>Changes to Terms</h2>
        <p>We reserve the right to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days notice prior to any new terms taking effect.</p>
      </section>

      {/* Governing Law */}
      <section>
        <h2>Governing Law</h2>
        <p>These Terms shall be interpreted and governed by the laws of the jurisdiction in which Codebase Apps operates, without regard to its conflict of law provisions.</p>
      </section>

      {/* Contact Information */}
      <section>
        <h2>Contact Information</h2>
        <p>If you have any questions about these Terms of Service, please contact Codebase Apps at: <a href="mailto:contact@codebaseapps.com">contact@codebaseapps.com</a></p>
      </section>

      {/* Footer */}
      <section 
        style={{ 
          backgroundColor: 'rgba(47, 102, 246, 0.05)',
          border: '1px solid rgba(47, 102, 246, 0.1)',
          borderRadius: '12px',
          padding: '24px',
          marginTop: '40px'
        }}
      >
        <h3 style={{ fontSize: '1.25rem', fontWeight: 600, marginBottom: '12px' }}>Agreement</h3>
        <p>By using the OCC application, you acknowledge that you have read and understood these Terms of Service and agree to be bound by them.</p>
      </section>
    </LegalPageTemplate>
  );
};

export default OCCTerms;
