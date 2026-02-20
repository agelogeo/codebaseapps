import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Index from "./pages/Index";
import About from "./pages/About";
import NotFound from "./pages/NotFound";
import OCC from "./pages/apps/OCC";
import Keibo from "./pages/apps/Keibo";
import KeiboJoin from "./pages/apps/KeiboJoin";
import OCCPrivacy from "./pages/apps/legal/OCCPrivacy";
import OCCTerms from "./pages/apps/legal/OCCTerms";
import KeiboPrivacy from "./pages/apps/legal/KeiboPrivacy";
import KeiboTerms from "./pages/apps/legal/KeiboTerms";

const queryClient = new QueryClient();

const App = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<Index />} />
            <Route path="/about" element={<About />} />
            <Route path="/occ" element={<OCC />} />
            <Route path="/occ/privacy" element={<OCCPrivacy />} />
            <Route path="/occ/terms" element={<OCCTerms />} />
            <Route path="/keibo" element={<Keibo />} />
            <Route path="/keibo/join" element={<KeiboJoin />} />
            <Route path="/keibo/privacy" element={<KeiboPrivacy />} />
            <Route path="/keibo/terms" element={<KeiboTerms />} />
            {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
            <Route path="*" element={<NotFound />} />
          </Routes>
        </BrowserRouter>
      </TooltipProvider>
    </QueryClientProvider>
  );
};

export default App;
