import { Users, ArrowRight, Download } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const KeiboJoin = () => {
  const navigate = useNavigate();
  const [channelData, setChannelData] = useState({
    name: "Community",
    description: "Join our community",
    members: "0",
    type: "channel"
  });

  useEffect(() => {
    // Extract data from URL parameters
    const params = new URLSearchParams(window.location.search);
    const name = params.get('name') || params.get('channel') || "Community";
    const description = params.get('description') || params.get('desc') || "Join our community";
    const members = params.get('members') || params.get('subscribers') || "0";
    const type = params.get('type') || "channel";
    
    setChannelData({ name, description, members, type });
  }, []);

  const handleJoin = () => {
    // Redirect to open the app with the same URL
    const currentUrl = window.location.href;
    const keiboDeepLink = `keibo://join${window.location.search}`;
    
    // Try to open the app, fallback to app store if not installed
    window.location.href = keiboDeepLink;
    
    // Fallback to app download page after a short delay
    setTimeout(() => {
      navigate('/keibo');
    }, 2000);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#0D1117] via-[#161B22] to-[#0D1117] flex items-center justify-center p-4">
      <div className="max-w-lg w-full">
        <Card className="bg-[#161B22] backdrop-blur-sm border-[#30363D] shadow-2xl">
          <CardHeader className="text-center pb-4">
            <div className="w-24 h-24 bg-[#FF7B00]/20 rounded-full flex items-center justify-center mx-auto mb-6 border-4 border-[#FF7B00]/30">
              <Users className="h-12 w-12 text-[#FF7B00]" />
            </div>
            <CardTitle className="text-3xl text-[#C9D1D9] mb-2">
              {channelData.name}
            </CardTitle>
            <CardDescription className="text-base text-[#8B949E]">
              {channelData.description}
            </CardDescription>
          </CardHeader>
          
          <CardContent className="space-y-6">
            <div className="text-center py-4 border-t border-b border-[#30363D]">
              <p className="text-[#8B949E] text-sm">
                {channelData.members} {channelData.members === "1" ? "member" : "members"}
              </p>
            </div>

            <Button 
              onClick={handleJoin}
              className="w-full bg-[#FF7B00] hover:bg-[#FF7B00]/90 text-white font-semibold py-6 text-lg"
              size="lg"
            >
              JOIN {channelData.type.toUpperCase()}
            </Button>

            <div className="text-center text-sm text-[#8B949E]">
              <p className="mb-4">
                You are invited to the {channelData.type} <span className="text-[#C9D1D9] font-semibold">{channelData.name}</span>.
              </p>
              <p>Click above to join.</p>
            </div>

            <div className="pt-4 border-t border-[#30363D]">
              <div className="flex items-center justify-center gap-2 text-sm text-[#8B949E]">
                <Download className="h-4 w-4" />
                <span>Don't have Keibo?</span>
                <button 
                  onClick={() => navigate('/keibo')}
                  className="text-[#58A6FF] hover:underline font-medium"
                >
                  Download App
                </button>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* URL Info Display */}
        <div className="mt-6 text-center">
          <p className="text-[#8B949E] text-xs">
            Powered by <span className="text-[#FF7B00] font-semibold">Keibo</span>
          </p>
        </div>
      </div>
    </div>
  );
};

export default KeiboJoin;
