import { Users, ArrowRight, Download } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const KeiboJoin = () => {
  const navigate = useNavigate();
  const [inviteData, setInviteData] = useState({
    code: "",
    groupName: "Community",
    groupDesc: "Join our community",
    members: "0"
  });

  useEffect(() => {
    // Extract data from URL parameters
    const params = new URLSearchParams(window.location.search);
    const code = params.get('code') || "";
    const groupName = params.get('groupName') || "Community";
    const groupDesc = params.get('groupDesc') || "Join our community";
    const members = params.get('members') || "0";
    
    setInviteData({ code, groupName, groupDesc, members });
  }, []);

  const handleJoin = () => {
    // Construct deep link with invite code
    const keiboDeepLink = inviteData.code 
      ? `keibo://invite?code=${inviteData.code}`
      : `keibo://invite`;
    
    // Try to open the app
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
              {inviteData.groupName}
            </CardTitle>
            <CardDescription className="text-base text-[#8B949E]">
              {inviteData.groupDesc}
            </CardDescription>
          </CardHeader>
          
          <CardContent className="space-y-6">
            <div className="text-center py-4 border-t border-b border-[#30363D]">
              <p className="text-[#8B949E] text-sm">
                {inviteData.members} {inviteData.members === "1" ? "member" : "members"}
              </p>
            </div>

            <Button 
              onClick={handleJoin}
              className="w-full bg-[#FF7B00] hover:bg-[#FF7B00]/90 text-white font-semibold py-6 text-lg"
              size="lg"
            >
              JOIN GROUP
            </Button>

            <div className="text-center text-sm text-[#8B949E]">
              <p className="mb-4">
                You are invited to the group <span className="text-[#C9D1D9] font-semibold">{inviteData.groupName}</span>.
              </p>
              {inviteData.code && (
                <p className="text-xs font-mono bg-[#0D1117] px-3 py-2 rounded border border-[#30363D] mb-4">
                  Invite Code: {inviteData.code}
                </p>
              )}
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
