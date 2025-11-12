import { Code2, Sparkles, Zap, Shield } from "lucide-react";
import Navigation from "@/components/Navigation";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Link } from "react-router-dom";

const Index = () => {
  return (
    <div className="min-h-screen bg-gradient-tech">
      <Navigation />
      
      {/* Hero Section */}
      <section className="container mx-auto px-6 pt-32 pb-20">
        <div className="max-w-4xl mx-auto text-center space-y-8">
          <div className="inline-block animate-float">
            <div className="p-6 rounded-2xl bg-primary/10 shadow-glow backdrop-blur-sm border border-primary/20">
              <Code2 className="h-20 w-20 text-primary animate-glow-pulse" />
            </div>
          </div>

          <div className="space-y-4 animate-fade-in">
            <h1 className="text-5xl md:text-6xl font-bold text-primary-foreground">
              Codebase Apps
            </h1>
            <p className="text-xl md:text-2xl text-primary-foreground/90 max-w-2xl mx-auto">
              Building the future of software, one line of code at a time
            </p>
          </div>

          <div className="flex flex-wrap gap-4 justify-center animate-fade-in-scale">
            <Link to="/about">
              <Button size="lg" className="shadow-medium hover:shadow-glow transition-all duration-300">
                Learn More
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="container mx-auto px-6 pb-20">
        <div className="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="group p-8 rounded-xl bg-card/50 backdrop-blur-sm border border-border/50 hover:bg-card/80 hover:shadow-medium transition-all duration-300 animate-fade-in">
            <div className="p-3 rounded-lg bg-primary/10 w-fit mb-4 group-hover:shadow-glow transition-all duration-300">
              <Sparkles className="h-6 w-6 text-primary" />
            </div>
            <h3 className="text-xl font-bold mb-2">Innovation</h3>
            <p className="text-muted-foreground">
              Pushing boundaries with cutting-edge technology and creative solutions
            </p>
          </div>

          <div className="group p-8 rounded-xl bg-card/50 backdrop-blur-sm border border-border/50 hover:bg-card/80 hover:shadow-medium transition-all duration-300 animate-fade-in" style={{ animationDelay: "0.1s" }}>
            <div className="p-3 rounded-lg bg-primary/10 w-fit mb-4 group-hover:shadow-glow transition-all duration-300">
              <Zap className="h-6 w-6 text-primary" />
            </div>
            <h3 className="text-xl font-bold mb-2">Performance</h3>
            <p className="text-muted-foreground">
              Lightning-fast applications optimized for the best user experience
            </p>
          </div>

          <div className="group p-8 rounded-xl bg-card/50 backdrop-blur-sm border border-border/50 hover:bg-card/80 hover:shadow-medium transition-all duration-300 animate-fade-in" style={{ animationDelay: "0.2s" }}>
            <div className="p-3 rounded-lg bg-primary/10 w-fit mb-4 group-hover:shadow-glow transition-all duration-300">
              <Shield className="h-6 w-6 text-primary" />
            </div>
            <h3 className="text-xl font-bold mb-2">Security</h3>
            <p className="text-muted-foreground">
              Enterprise-grade security measures to protect your valuable data
            </p>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
};

export default Index;
