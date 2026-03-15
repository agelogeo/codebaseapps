import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const CodebaseAppsWeb());
}

class CodebaseAppsWeb extends StatelessWidget {
  const CodebaseAppsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Codebase Apps',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
