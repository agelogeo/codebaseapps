import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../shared/smart_app_banner.dart';

const _keiboAppStoreId = '6755344228';

class KeiboJoinPage extends StatefulWidget {
  const KeiboJoinPage({super.key});

  @override
  State<KeiboJoinPage> createState() => _KeiboJoinPageState();
}

class _KeiboJoinPageState extends State<KeiboJoinPage> {
  String code = '';
  String groupName = 'Community';
  String groupDesc = 'Join our community';
  String members = '0';

  @override
  void initState() {
    super.initState();
    // Read directly from window.location.search, exactly like the old HTML implementation
    final params = Uri.parse(html.window.location.href).queryParameters;
    code = params['code'] ?? '';
    groupName = params['groupName'] ?? 'Community';
    groupDesc = params['groupDesc'] ?? 'Join our community';
    members = params['members'] ?? '0';

    SmartAppBanner.show(
      appId: _keiboAppStoreId,
      appArgument: 'keibo://join?code=$code',
    );
  }

  @override
  void dispose() {
    SmartAppBanner.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.keiboBg, AppColors.keiboCard, AppColors.keiboBg],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                    color: AppColors.keiboCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.keiboBorder),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(128),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      // Group icon
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: AppColors.keiboOrange.withAlpha(51),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.keiboOrange.withAlpha(76),
                            width: 4,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.people,
                            size: 48,
                            color: AppColors.keiboOrange,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Group name
                      Text(
                        groupName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.keiboText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        groupDesc,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.keiboMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // Members count
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.keiboBorder),
                            bottom: BorderSide(color: AppColors.keiboBorder),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$members ${members == "1" ? "member" : "members"}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.keiboMuted,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Join button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (code.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Invalid invitation link: no invite code found',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            final deepLink = 'keibo://invite?code=$code';
                            html.window.location.href = deepLink;
                            Timer(const Duration(seconds: 2), () {
                              if (mounted) context.go('/keibo');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.keiboOrange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('JOIN GROUP'),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Info text
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.keiboMuted,
                          ),
                          children: [
                            const TextSpan(
                              text: 'You are invited to the group ',
                            ),
                            TextSpan(
                              text: groupName,
                              style: const TextStyle(
                                color: AppColors.keiboText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                      if (code.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.keiboBg,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.keiboBorder),
                          ),
                          child: Text(
                            'Invite Code: $code',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                              color: AppColors.keiboMuted,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      const Text(
                        'Click above to join.',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.keiboMuted,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Download link
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.keiboBorder),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.download,
                              size: 16,
                              color: AppColors.keiboMuted,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Don't have Keibo? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.keiboMuted,
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => context.go('/keibo'),
                                child: const Text(
                                  'Download App',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.keiboBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12, color: AppColors.keiboMuted),
                    children: [
                      TextSpan(text: 'Powered by '),
                      TextSpan(
                        text: 'Keibo',
                        style: TextStyle(
                          color: AppColors.keiboOrange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
