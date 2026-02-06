import { Mail, User, Lock, ArrowRight, Check, Sparkles } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import { useState } from "react";

const KeiboJoin = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    agreeToTerms: false
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle form submission
    console.log("Form submitted:", formData);
  };

  const perks = [
    "Instant access to all features",
    "Free for the first 30 days",
    "Cancel anytime, no questions asked",
    "Join a community of 10,000+ users"
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-950 to-gray-900">
      <main className="container mx-auto px-4 py-16">
        <div className="max-w-6xl mx-auto">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            {/* Left Column - Form */}
            <div className="animate-fade-in">
              <Card className="bg-gray-800/50 backdrop-blur-sm border-gray-700 shadow-xl">
                <CardHeader>
                  <div className="flex items-center gap-2 mb-2">
                    <Sparkles className="h-6 w-6 text-purple-400" />
                    <CardTitle className="text-3xl text-white">Join Keibo</CardTitle>
                  </div>
                  <CardDescription className="text-base text-gray-400">
                    Create your account and start your free trial today
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <form onSubmit={handleSubmit} className="space-y-6">
                    <div className="space-y-2">
                      <Label htmlFor="name" className="text-sm font-medium text-gray-300">
                        Full Name
                      </Label>
                      <div className="relative">
                        <User className="absolute left-3 top-3 h-4 w-4 text-gray-500" />
                        <Input
                          id="name"
                          type="text"
                          placeholder="John Doe"
                          className="pl-10 bg-gray-700/50 border-gray-600 text-white placeholder:text-gray-500"
                          value={formData.name}
                          onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                          required
                        />
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="email" className="text-sm font-medium text-gray-300">
                        Email Address
                      </Label>
                      <div className="relative">
                        <Mail className="absolute left-3 top-3 h-4 w-4 text-gray-500" />
                        <Input
                          id="email"
                          type="email"
                          placeholder="john@example.com"
                          className="pl-10 bg-gray-700/50 border-gray-600 text-white placeholder:text-gray-500"
                          value={formData.email}
                          onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                          required
                        />
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="password" className="text-sm font-medium text-gray-300">
                        Password
                      </Label>
                      <div className="relative">
                        <Lock className="absolute left-3 top-3 h-4 w-4 text-gray-500" />
                        <Input
                          id="password"
                          type="password"
                          placeholder="Create a strong password"
                          className="pl-10 bg-gray-700/50 border-gray-600 text-white placeholder:text-gray-500"
                          value={formData.password}
                          onChange={(e) => setFormData({ ...formData, password: e.target.value })}
                          required
                        />
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="confirmPassword" className="text-sm font-medium text-gray-300">
                        Confirm Password
                      </Label>
                      <div className="relative">
                        <Lock className="absolute left-3 top-3 h-4 w-4 text-gray-500" />
                        <Input
                          id="confirmPassword"
                          type="password"
                          placeholder="Confirm your password"
                          className="pl-10 bg-gray-700/50 border-gray-600 text-white placeholder:text-gray-500"
                          value={formData.confirmPassword}
                          onChange={(e) => setFormData({ ...formData, confirmPassword: e.target.value })}
                          required
                        />
                      </div>
                    </div>

                    <div className="flex items-start gap-3">
                      <Checkbox
                        id="terms"
                        checked={formData.agreeToTerms}
                        onCheckedChange={(checked) => 
                          setFormData({ ...formData, agreeToTerms: checked as boolean })
                        }
                        required
                      />
                      <Label htmlFor="terms" className="text-sm text-gray-400 leading-relaxed cursor-pointer">
                        I agree to the{" "}
                        <a href="#" className="text-purple-400 hover:underline">
                          Terms of Service
                        </a>{" "}
                        and{" "}
                        <a href="#" className="text-purple-400 hover:underline">
                          Privacy Policy
                        </a>
                      </Label>
                    </div>

                    <Button 
                      type="submit" 
                      className="w-full bg-purple-600 hover:bg-purple-700"
                      size="lg"
                    >
                      Create Account
                      <ArrowRight className="ml-2 h-5 w-5" />
                    </Button>

                    <p className="text-center text-sm text-gray-400">
                      Already have an account?{" "}
                      <a href="#" className="text-purple-400 hover:underline font-medium">
                        Sign in
                      </a>
                    </p>
                  </form>
                </CardContent>
              </Card>
            </div>

            {/* Right Column - Benefits */}
            <div className="space-y-8">
              <div className="animate-fade-in" style={{ animationDelay: "0.1s" }}>
                <h2 className="text-4xl font-bold mb-4 bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
                  Start Your Journey with Keibo
                </h2>
                <p className="text-xl text-gray-300 mb-8">
                  Join thousands of satisfied users who have transformed their workflow with Keibo.
                </p>
              </div>

              <div className="space-y-4">
                {perks.map((perk, index) => (
                  <div 
                    key={index} 
                    className="flex items-start gap-4 p-4 bg-gray-800/40 backdrop-blur-sm rounded-lg border border-gray-700 hover:shadow-md hover:shadow-purple-500/10 transition-all duration-300"
                    style={{ animationDelay: `${0.2 + index * 0.1}s` }}
                  >
                    <div className="w-8 h-8 bg-purple-500/20 rounded-full flex items-center justify-center flex-shrink-0">
                      <Check className="h-5 w-5 text-purple-400" />
                    </div>
                    <p className="text-gray-300 pt-1">{perk}</p>
                  </div>
                ))}
              </div>

              <Card className="bg-gradient-to-br from-purple-600/90 to-pink-600/90 text-white border-0">
                <CardContent className="pt-6">
                  <div className="flex items-start gap-4">
                    <Sparkles className="h-8 w-8 flex-shrink-0" />
                    <div>
                      <h3 className="text-xl font-semibold mb-2">Special Offer</h3>
                      <p className="text-purple-100">
                        Sign up today and get your first 30 days completely free. 
                        No credit card required, cancel anytime.
                      </p>
                    </div>
                  </div>
                </CardContent>
              </Card>

              <div className="text-center p-6 bg-gray-800/40 backdrop-blur-sm rounded-lg border border-gray-700">
                <p className="text-sm text-gray-400">
                  🔒 Your data is secure and encrypted. We never share your information.
                </p>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default KeiboJoin;
