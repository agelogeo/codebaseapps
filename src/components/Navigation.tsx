import { Code2, Menu, X, ChevronDown } from "lucide-react";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

const Navigation = () => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [appsDropdownOpen, setAppsDropdownOpen] = useState(false);
  const navigate = useNavigate();

  const apps = [
    { name: "OCC", path: "/occ" },
    { name: "Keibo", path: "/keibo" },
  ];

  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    if (element) {
      const offset = 80; // Account for fixed navbar
      const elementPosition = element.getBoundingClientRect().top + window.pageYOffset;
      window.scrollTo({
        top: elementPosition - offset,
        behavior: 'smooth'
      });
      setMobileMenuOpen(false);
    }
  };

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-background/80 backdrop-blur-md border-b border-border">
      <div className="container mx-auto px-4 sm:px-6 py-3 sm:py-4">
        <div className="flex items-center justify-between">
          <button onClick={() => scrollToSection('home')} className="flex items-center gap-2 group">
            <div className="p-1.5 sm:p-2 rounded-lg bg-gradient-tech shadow-glow group-hover:shadow-medium transition-all duration-300">
              <Code2 className="h-5 w-5 sm:h-6 sm:w-6 text-primary-foreground" />
            </div>
            <span className="text-lg sm:text-xl font-bold text-foreground">
              Codebase Apps
            </span>
          </button>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-6">
            <button
              onClick={() => scrollToSection('home')}
              className="text-sm font-medium transition-colors hover:text-primary text-muted-foreground"
            >
              Home
            </button>
            <button
              onClick={() => scrollToSection('about')}
              className="text-sm font-medium transition-colors hover:text-primary text-muted-foreground"
            >
              About
            </button>
            
            {/* Apps Dropdown */}
            <div className="relative">
              <button
                onClick={() => setAppsDropdownOpen(!appsDropdownOpen)}
                onBlur={() => setTimeout(() => setAppsDropdownOpen(false), 200)}
                className="text-sm font-medium transition-colors hover:text-primary text-muted-foreground flex items-center gap-1"
              >
                Apps
                <ChevronDown className={`h-4 w-4 transition-transform ${appsDropdownOpen ? 'rotate-180' : ''}`} />
              </button>
              
              {appsDropdownOpen && (
                <div className="absolute top-full mt-2 right-0 bg-background/95 backdrop-blur-md border border-border rounded-lg shadow-lg min-w-[150px] overflow-hidden">
                  {apps.map((app) => (
                    <button
                      key={app.path}
                      onClick={() => {
                        navigate(app.path);
                        setAppsDropdownOpen(false);
                      }}
                      className="w-full text-left px-4 py-2 text-sm font-medium text-muted-foreground hover:bg-muted hover:text-primary transition-colors"
                    >
                      {app.name}
                    </button>
                  ))}
                </div>
              )}
            </div>
          </div>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="md:hidden p-2 text-foreground hover:text-primary transition-colors"
            aria-label="Toggle menu"
          >
            {mobileMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
          </button>
        </div>

        {/* Mobile Menu */}
        {mobileMenuOpen && (
          <div className="md:hidden absolute top-full left-0 right-0 bg-background/95 backdrop-blur-md border-b border-border shadow-lg">
            <div className="container mx-auto px-4 py-4 flex flex-col gap-4">
              <button
                onClick={() => scrollToSection('home')}
                className="text-sm font-medium transition-colors hover:text-primary text-muted-foreground text-left py-2"
              >
                Home
              </button>
              <button
                onClick={() => scrollToSection('about')}
                className="text-sm font-medium transition-colors hover:text-primary text-muted-foreground text-left py-2"
              >
                About
              </button>
              
              {/* Apps in Mobile Menu */}
              {apps.map((app) => (
                <button
                  key={app.path}
                  onClick={() => {
                    navigate(app.path);
                    setMobileMenuOpen(false);
                  }}
                  className="w-full text-sm font-medium transition-colors hover:text-primary text-muted-foreground text-left py-2"
                >
                  {app.name}
                </button>
              ))}
            </div>
          </div>
        )}
      </div>
    </nav>
  );
};

export default Navigation;
