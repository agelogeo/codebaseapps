import { Mail, Twitter, Instagram } from "lucide-react";

const Footer = () => {
  return (
    <footer className="bg-card/50 backdrop-blur border-t border-border/50 py-8">
      <div className="container mx-auto px-6">
        <div className="flex flex-col md:flex-row items-center justify-between gap-4">
          {/* Email */}
          <div className="flex items-center gap-2 text-muted-foreground hover:text-foreground transition-colors">
            <Mail className="h-4 w-4" />
            <a href="mailto:codebaseapps@gmail.com">codebaseapps@gmail.com</a>
          </div>

          {/* Social Media Links */}
          <div className="flex items-center gap-4">
            <a 
              href="https://twitter.com/codebaseapps" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Twitter"
            >
              <Twitter className="h-5 w-5" />
            </a>
            <a 
              href="https://instagram.com/codebaseapps" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Instagram"
            >
              <Instagram className="h-5 w-5" />
            </a>
          </div>

          {/* Copyright */}
          <div className="text-sm text-muted-foreground">
            Copyright 2025 © Codebase Apps
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
