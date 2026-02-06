import { Smartphone, Lock, Zap, Users, Download, Check, Apple, Play } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

const Keibo = () => {
  const handleDownload = (platform: string) => {
    // Handle platform-specific downloads
    console.log(`Downloading for ${platform}`);
  };

  const features = [
    {
      icon: Smartphone,
      title: "Mobile First",
      description: "Designed for your smartphone with a seamless experience on any device."
    },
    {
      icon: Lock,
      title: "Secure by Default",
      description: "Bank-level encryption keeps your information safe and secure."
    },
    {
      icon: Zap,
      title: "Lightning Fast",
      description: "Optimized performance for quick access and smooth interactions."
    },
    {
      icon: Users,
      title: "Community Driven",
      description: "Join thousands of users and be part of our growing community."
    }
  ];

  const benefits = [
    "Easy setup in minutes",
    "No credit card required",
    "Regular updates and improvements",
    "24/7 customer support",
    "Cross-platform compatibility"
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#0D1117] via-[#161B22] to-[#0D1117]">
      <main className="container mx-auto px-4 py-16">
        {/* Hero Section */}
        <div className="text-center mb-16 animate-fade-in">
          <div className="inline-block px-4 py-2 bg-[#FF7B00]/20 text-[#FF7B00] rounded-full text-sm font-semibold mb-6">
            ✨ Now Available
          </div>
          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-[#FF7B00] to-[#58A6FF] bg-clip-text text-transparent">
            Welcome to Keibo
          </h1>
          <p className="text-xl text-[#C9D1D9] mb-8 max-w-2xl mx-auto">
            The next generation app that simplifies your daily tasks and enhances your productivity.
          </p>
          <div className="flex gap-4 justify-center flex-wrap">
            <Button 
              size="lg" 
              className="bg-[#FF7B00] hover:bg-[#FF7B00]/90"
              onClick={() => handleDownload('ios')}
            >
              <Apple className="mr-2 h-5 w-5" />
              Download for iOS
            </Button>
            <Button 
              size="lg" 
              className="bg-[#58A6FF] hover:bg-[#58A6FF]/90"
              onClick={() => handleDownload('android')}
            >
              <Play className="mr-2 h-5 w-5" />
              Download for Android
            </Button>
          </div>
          <p className="text-sm text-[#8B949E] mt-4">
            Free to download • Available on all platforms
          </p>
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
          {features.map((feature, index) => (
            <Card 
              key={index} 
              className="bg-[#161B22] backdrop-blur-sm border-[#30363D] hover:shadow-xl hover:shadow-[#FF7B00]/10 transition-all duration-300 hover:-translate-y-1"
            >
              <CardHeader>
                <div className="w-12 h-12 bg-[#FF7B00]/20 rounded-lg flex items-center justify-center mb-4">
                  <feature.icon className="h-6 w-6 text-[#FF7B00]" />
                </div>
                <CardTitle className="text-lg text-[#C9D1D9]">{feature.title}</CardTitle>
              </CardHeader>
              <CardContent>
                <CardDescription className="text-sm text-[#8B949E]">
                  {feature.description}
                </CardDescription>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Benefits Section */}
        <Card className="bg-gradient-to-br from-[#FF7B00] to-[#58A6FF] text-white border-0 max-w-4xl mx-auto mb-16">
          <CardHeader>
            <CardTitle className="text-3xl text-white">Why Choose Keibo?</CardTitle>
            <CardDescription className="text-white/80 text-base">
              Everything you need to get started and succeed
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {benefits.map((benefit, index) => (
                <div key={index} className="flex items-center gap-3">
                  <div className="w-6 h-6 bg-white/20 rounded-full flex items-center justify-center flex-shrink-0">
                    <Check className="h-4 w-4 text-white" />
                  </div>
                  <span className="text-white">{benefit}</span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* CTA Section */}
        <div className="text-center bg-[#161B22] backdrop-blur-sm rounded-2xl p-12 border border-[#30363D]">
          <h2 className="text-4xl font-bold mb-4 text-[#C9D1D9]">Ready to Get Started?</h2>
          <p className="text-xl text-[#8B949E] mb-8 max-w-2xl mx-auto">
            Download Keibo today and join our growing community
          </p>
          <div className="flex gap-4 justify-center flex-wrap">
            <Button 
              size="lg" 
              className="bg-[#FF7B00] hover:bg-[#FF7B00]/90"
              onClick={() => handleDownload('ios')}
            >
              <Download className="mr-2 h-5 w-5" />
              Download Now
            </Button>
          </div>
          <p className="text-sm text-[#8B949E] mt-4">
            No account required to start • Instant access
          </p>
        </div>
      </main>
    </div>
  );
};

export default Keibo;
