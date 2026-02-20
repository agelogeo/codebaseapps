import { ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useNavigate } from "react-router-dom";
import { ReactNode } from "react";

// 🎨 THEME CONFIGURATION
// This is where you declare the primary theme color for each app's legal pages
export interface LegalPageTheme {
  primaryColor: string;        // Main brand color hex (e.g., "#2f66f6" for OCC blue, "#9333ea" for Keibo purple)
  primaryColorRGB: string;      // RGB values for transparency effects (e.g., "47, 102, 246" for blue)
}

interface LegalPageTemplateProps {
  appName: string;
  title: string;
  lastUpdated: string;
  backTo: string;              // Route to go back to
  theme: LegalPageTheme;       // 👈 THIS IS WHERE YOU SET YOUR APP'S THEME COLORS
  children: ReactNode;
}

const LegalPageTemplate = ({ 
  appName, 
  title, 
  lastUpdated, 
  backTo, 
  theme,
  children 
}: LegalPageTemplateProps) => {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-950 py-10 px-4">
      <div className="max-w-[800px] mx-auto bg-white dark:bg-gray-900 shadow-lg rounded-xl p-6 md:p-10">
        {/* Back Button */}
        <Button
          variant="ghost"
          className="mb-6 text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800"
          onClick={() => navigate(backTo)}
        >
          <ArrowLeft className="mr-2 h-4 w-4" />
          Back to {appName}
        </Button>

        {/* Header - matches original design */}
        <header className="text-center mb-10 pb-5 border-b-2 border-gray-200 dark:border-gray-700">
          <h1 className="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white mb-2">
            {title}
          </h1>
          <p className="italic text-gray-600 dark:text-gray-400 text-sm">
            Last updated: {lastUpdated}
          </p>
        </header>

        {/* Content */}
        <main className="space-y-8">
          <div 
            className="legal-content"
            style={{
              // Custom CSS variables for theme colors
              ['--primary-color' as string]: theme.primaryColor,
              ['--primary-rgb' as string]: theme.primaryColorRGB,
            }}
          >
            {children}
          </div>

          {/* Footer with primary color highlight */}
          <div 
            className="rounded-xl p-6 mt-10"
            style={{
              backgroundColor: `rgba(${theme.primaryColorRGB}, 0.05)`,
              border: `1px solid rgba(${theme.primaryColorRGB}, 0.1)`,
            }}
          >
            <Button
              style={{ backgroundColor: theme.primaryColor }}
              className="w-full hover:opacity-90 text-white"
              onClick={() => navigate(backTo)}
            >
              Return to {appName}
            </Button>
          </div>
        </main>

        {/* Styles matching original legal-styles.css */}
        <style>{`
          .legal-content section {
            margin-bottom: 2rem;
          }
          
          .legal-content h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 1rem;
            border-bottom: 1px solid #e1e5e9;
            padding-bottom: 0.5rem;
          }
          
          .dark .legal-content h2 {
            color: #ffffff;
            border-bottom-color: #333;
          }
          
          .legal-content p {
            font-size: 1rem;
            line-height: 1.7;
            color: #4a4a4a;
            margin-bottom: 0.75rem;
          }
          
          .dark .legal-content p {
            color: #cccccc;
          }
          
          .legal-content ul {
            list-style: disc;
            margin-left: 1.5rem;
            margin-bottom: 0.75rem;
          }
          
          .legal-content li {
            color: #4a4a4a;
            line-height: 1.7;
            margin-bottom: 0.5rem;
          }
          
          .dark .legal-content li {
            color: #cccccc;
          }
          
          .legal-content strong {
            font-weight: 600;
            color: #1a1a1a;
          }
          
          .dark .legal-content strong {
            color: #ffffff;
          }
          
          .legal-content a {
            color: var(--primary-color);
            text-decoration: underline;
          }
          
          .legal-content a:hover {
            opacity: 0.8;
          }
        `}</style>
      </div>
    </div>
  );
};

export default LegalPageTemplate;
