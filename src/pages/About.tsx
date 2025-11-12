import { FileText, Download, Calendar, Building2, Users, Shield } from "lucide-react";
import Navigation from "@/components/Navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

// Annual statements - Replace these paths with your actual PDF files
// Place your PDF files in the public/statements/ folder
const annualStatements = [
  { year: 2024, title: "Annual Financial Statement 2024", size: "2.4 MB", date: "March 2024", path: "/statements/annual-2024.pdf" },
  { year: 2023, title: "Annual Financial Statement 2023", size: "2.1 MB", date: "March 2023", path: "/statements/annual-2023.pdf" },
  { year: 2022, title: "Annual Financial Statement 2022", size: "1.9 MB", date: "March 2022", path: "/statements/annual-2022.pdf" },
  { year: 2021, title: "Annual Financial Statement 2021", size: "1.8 MB", date: "March 2021", path: "/statements/annual-2021.pdf" },
];

const About = () => {
  const handleDownload = (path: string, title: string) => {
    const link = document.createElement('a');
    link.href = path;
    link.download = title;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <div className="min-h-screen bg-gradient-tech">
      <Navigation />
      
      <main className="container mx-auto px-6 pt-32 pb-20">
        <div className="max-w-4xl mx-auto space-y-8 animate-fade-in">
          {/* Company Header */}
          <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur">
            <CardHeader>
              <CardTitle className="text-3xl font-bold">Codebase Apps ΜΟΝ.Ι.Κ.Ε.</CardTitle>
              <CardDescription>Μονοπρόσωπη Ιδιωτική Κεφαλαιουχική Εταιρία</CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">
              <div>
                <h3 className="text-lg font-semibold mb-2">Our Mission</h3>
                <p className="text-muted-foreground leading-relaxed">
                  At Codebase Apps, we're dedicated to creating cutting-edge software solutions 
                  that empower businesses to thrive in the digital age. Our team of experienced 
                  developers and designers work together to deliver exceptional products that 
                  combine functionality with beautiful design.
                </p>
              </div>
            </CardContent>
          </Card>

          {/* Company Registration Details */}
          <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur">
            <CardHeader>
              <CardTitle className="text-2xl font-bold">Company Registration</CardTitle>
              <CardDescription>Official registration information</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm">
                <div>
                  <p className="text-muted-foreground mb-1">Address</p>
                  <p className="font-medium">Δημητρίου Γληνού 5Α</p>
                  <p className="font-medium">546 28, Μενεμένη</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Municipality</p>
                  <p className="font-medium">Μενεμένη - Αμπελοκήπων</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Region</p>
                  <p className="font-medium">Θεσσαλονίκης</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Tax ID (ΑΦΜ)</p>
                  <p className="font-medium">801825022</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Tax Office (ΔΟΥ)</p>
                  <p className="font-medium">Αμπελοκήπων</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">GEMI (Γ.Ε.Μ.Η.)</p>
                  <p className="font-medium">164043006000</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Foundation Date</p>
                  <p className="font-medium">05/05/2022</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Expiry Date</p>
                  <p className="font-medium">05/05/2052</p>
                </div>
                <div>
                  <p className="text-muted-foreground mb-1">Share Capital</p>
                  <p className="font-medium">3.000€</p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Company Structure */}
          <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur">
            <CardHeader>
              <CardTitle className="text-2xl font-bold">Company Structure</CardTitle>
              <CardDescription>Management and ownership information</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <div className="p-4 rounded-lg bg-secondary/30 border border-border/50">
                  <div className="flex items-start gap-4">
                    <div className="p-3 rounded-lg bg-primary/10">
                      <Users className="h-6 w-6 text-primary" />
                    </div>
                    <div className="flex-1">
                      <p className="font-semibold text-lg">Georgios Angelopoulos</p>
                      <p className="text-sm text-muted-foreground">ΔΙΑΧΕΙΡΙΣΤΗΣ (Manager)</p>
                      <div className="grid grid-cols-2 gap-4 mt-3 text-sm">
                        <div>
                          <p className="text-muted-foreground">Tax ID (ΑΦΜ)</p>
                          <p className="font-medium">163753772</p>
                        </div>
                        <div>
                          <p className="text-muted-foreground">Start Date</p>
                          <p className="font-medium">05/05/2022</p>
                        </div>
                        <div>
                          <p className="text-muted-foreground">Ownership</p>
                          <p className="font-medium">100%</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Quick Links Section */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur hover:shadow-elevated transition-all cursor-pointer group">
              <CardContent className="pt-6">
                <div className="flex flex-col items-center text-center space-y-3">
                  <div className="p-4 rounded-lg bg-primary/10 group-hover:bg-primary/20 transition-colors">
                    <Building2 className="h-8 w-8 text-primary" />
                  </div>
                  <h3 className="font-semibold text-lg">Business Registry</h3>
                  <p className="text-sm text-muted-foreground">GEMI: 164043006000</p>
                </div>
              </CardContent>
            </Card>

            <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur hover:shadow-elevated transition-all cursor-pointer group">
              <CardContent className="pt-6">
                <div className="flex flex-col items-center text-center space-y-3">
                  <div className="p-4 rounded-lg bg-primary/10 group-hover:bg-primary/20 transition-colors">
                    <Shield className="h-8 w-8 text-primary" />
                  </div>
                  <h3 className="font-semibold text-lg">Legal Status</h3>
                  <p className="text-sm text-muted-foreground">Active since 2022</p>
                </div>
              </CardContent>
            </Card>

            <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur hover:shadow-elevated transition-all cursor-pointer group">
              <CardContent className="pt-6">
                <div className="flex flex-col items-center text-center space-y-3">
                  <div className="p-4 rounded-lg bg-primary/10 group-hover:bg-primary/20 transition-colors">
                    <FileText className="h-8 w-8 text-primary" />
                  </div>
                  <h3 className="font-semibold text-lg">Financial Reports</h3>
                  <p className="text-sm text-muted-foreground">View statements below</p>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Annual Statements Section */}
          <Card className="shadow-medium border-border/50 bg-card/95 backdrop-blur">
            <CardHeader>
              <CardTitle className="text-2xl font-bold">Annual Statements</CardTitle>
              <CardDescription>Download yearly financial documents</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {annualStatements.map((statement) => (
                  <div
                    key={statement.year}
                    className="flex items-center justify-between p-4 rounded-lg bg-secondary/50 hover:bg-secondary transition-all duration-300 group"
                  >
                    <div className="flex items-center gap-4">
                      <div className="p-3 rounded-lg bg-primary/10 group-hover:bg-primary/20 transition-colors">
                        <FileText className="h-6 w-6 text-primary" />
                      </div>
                      <div>
                        <p className="font-semibold">{statement.title}</p>
                        <div className="flex items-center gap-3 mt-1">
                          <span className="text-xs text-muted-foreground flex items-center gap-1">
                            <Calendar className="h-3 w-3" />
                            {statement.date}
                          </span>
                          <span className="text-xs text-muted-foreground">
                            {statement.size}
                          </span>
                        </div>
                      </div>
                    </div>
                    <Button 
                      size="sm" 
                      onClick={() => handleDownload(statement.path, statement.title)}
                      className="shadow-soft hover:shadow-medium transition-all"
                    >
                      <Download className="h-4 w-4 mr-2" />
                      Download
                    </Button>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>
      </main>
    </div>
  );
};

export default About;
