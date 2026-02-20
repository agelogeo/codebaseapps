import { Shield, FileText, Download, ExternalLink, Check } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useNavigate } from "react-router-dom";

const OCC = () => {
  const navigate = useNavigate();

  const features = [
    {
      icon: Shield,
      title: "Secure & Private",
      description: "Your data is encrypted and stays private. We never share your information."
    },
    {
      icon: FileText,
      title: "Easy to Use",
      description: "Simple, intuitive interface designed for everyone."
    },
    {
      icon: Check,
      title: "Reliable",
      description: "Built with modern technology for consistent performance."
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-900 via-blue-950 to-gray-900">
      <main className="container mx-auto px-4 py-16">
        {/* Hero Section */}
        <div className="text-center mb-16 animate-fade-in">
          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-blue-400 to-purple-400 bg-clip-text text-transparent">
            OCC App
          </h1>
          <p className="text-xl text-gray-300 mb-8 max-w-2xl mx-auto">
            Your reliable companion for [describe what OCC does]
          </p>
          <div className="flex gap-4 justify-center flex-wrap">
            <Button size="lg" className="bg-blue-600 hover:bg-blue-700">
              <Download className="mr-2 h-5 w-5" />
              Download for iOS
            </Button>
            <Button size="lg" variant="outline" className="border-blue-600 text-blue-600 hover:bg-blue-50">
              <Download className="mr-2 h-5 w-5" />
              Download for Android
            </Button>
          </div>
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
          {features.map((feature, index) => (
            <Card 
              key={index} 
              className="bg-gray-800/50 backdrop-blur-sm border-gray-700 hover:shadow-xl hover:shadow-blue-500/10 transition-all duration-300 hover:-translate-y-1"
            >
              <CardHeader>
                <div className="w-12 h-12 bg-blue-500/20 rounded-lg flex items-center justify-center mb-4">
                  <feature.icon className="h-6 w-6 text-blue-400" />
                </div>
                <CardTitle className="text-xl text-white">{feature.title}</CardTitle>
              </CardHeader>
              <CardContent>
                <CardDescription className="text-base text-gray-400">
                  {feature.description}
                </CardDescription>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Legal Links Section */}
        <Card className="bg-gray-800/50 backdrop-blur-sm border-gray-700 max-w-3xl mx-auto">
          <CardHeader>
            <CardTitle className="text-2xl text-white">Legal & Support</CardTitle>
            <CardDescription className="text-gray-400">
              Review our terms, privacy policy, and support resources
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex flex-col sm:flex-row gap-4">
              <Button 
                variant="outline" 
                className="flex-1 justify-start"
                onClick={() => navigate('/occ/privacy')}
              >
                <FileText className="mr-2 h-4 w-4" />
                Privacy Policy
              </Button>
              <Button 
                variant="outline" 
                className="flex-1 justify-start"
                onClick={() => navigate('/occ/terms')}
              >
                <FileText className="mr-2 h-4 w-4" />
                Terms of Service
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Contact Section */}
        <div className="text-center mt-16">
          <h2 className="text-3xl font-bold mb-4 text-white">Need Help?</h2>
          <p className="text-gray-300 mb-6">
            Our support team is here to assist you
          </p>
          <Button variant="outline" size="lg" className="border-gray-600 text-gray-300 hover:bg-gray-800">
            Contact Support
          </Button>
        </div>
      </main>
    </div>
  );
};

export default OCC;
