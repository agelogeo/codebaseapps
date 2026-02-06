import { Smartphone, Lock, Zap, Users, ArrowRight, Check } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useNavigate } from "react-router-dom";

const Keibo = () => {
  const navigate = useNavigate();

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
    <div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-950 to-gray-900">
      <main className="container mx-auto px-4 py-16">
        {/* Hero Section */}
        <div className="text-center mb-16 animate-fade-in">
          <div className="inline-block px-4 py-2 bg-purple-500/20 text-purple-300 rounded-full text-sm font-semibold mb-6">
            ✨ Now Available
          </div>
          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
            Welcome to Keibo
          </h1>
          <p className="text-xl text-gray-300 mb-8 max-w-2xl mx-auto">
            The next generation app that simplifies your daily tasks and enhances your productivity.
          </p>
          <div className="flex gap-4 justify-center flex-wrap">
            <Button 
              size="lg" 
              className="bg-purple-600 hover:bg-purple-700"
              onClick={() => navigate('/keibo/join')}
            >
              Get Started Free
              <ArrowRight className="ml-2 h-5 w-5" />
            </Button>
            <Button 
              size="lg" 
              variant="outline" 
              className="border-gray-600 text-gray-300 hover:bg-gray-800"
            >
              Watch Demo
            </Button>
          </div>
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
          {features.map((feature, index) => (
            <Card 
              key={index} 
              className="bg-gray-800/50 backdrop-blur-sm border-gray-700 hover:shadow-xl hover:shadow-purple-500/10 transition-all duration-300 hover:-translate-y-1"
            >
              <CardHeader>
                <div className="w-12 h-12 bg-purple-500/20 rounded-lg flex items-center justify-center mb-4">
                  <feature.icon className="h-6 w-6 text-purple-400" />
                </div>
                <CardTitle className="text-lg text-white">{feature.title}</CardTitle>
              </CardHeader>
              <CardContent>
                <CardDescription className="text-sm text-gray-400">
                  {feature.description}
                </CardDescription>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Benefits Section */}
        <Card className="bg-gradient-to-br from-purple-600/90 to-pink-600/90 text-white border-0 max-w-4xl mx-auto mb-16">
          <CardHeader>
            <CardTitle className="text-3xl text-white">Why Choose Keibo?</CardTitle>
            <CardDescription className="text-purple-100 text-base">
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
        <div className="text-center bg-gray-800/50 backdrop-blur-sm rounded-2xl p-12 border border-gray-700">
          <h2 className="text-4xl font-bold mb-4 text-white">Ready to Get Started?</h2>
          <p className="text-xl text-gray-300 mb-8 max-w-2xl mx-auto">
            Join our community today and experience the difference
          </p>
          <Button 
            size="lg" 
            className="bg-purple-600 hover:bg-purple-700"
            onClick={() => navigate('/keibo/join')}
          >
            Create Your Account
            <ArrowRight className="ml-2 h-5 w-5" />
          </Button>
          <p className="text-sm text-gray-400 mt-4">
            No credit card required • Free to start
          </p>
        </div>
      </main>
    </div>
  );
};

export default Keibo;
