import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;
  final Color? iconBgColor;
  final Color? bgColor;
  final Color? borderColor;
  final Color? titleColor;
  final Color? descColor;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
    this.iconBgColor,
    this.bgColor,
    this.borderColor,
    this.titleColor,
    this.descColor,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _hovering ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: widget.bgColor ?? AppColors.cardBg.withAlpha(128),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.borderColor ?? AppColors.border.withAlpha(128),
          ),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: (widget.iconColor ?? AppColors.primary).withAlpha(
                      25,
                    ),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: widget.iconBgColor ?? AppColors.primary.withAlpha(25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  size: 24,
                  color: widget.iconColor ?? AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: widget.titleColor ?? AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14,
                color: widget.descColor ?? AppColors.mutedForeground,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String? headerTitle;
  final String? headerSubtitle;
  final Widget child;
  final Color? bgColor;
  final Color? borderColor;

  const InfoCard({
    super.key,
    this.headerTitle,
    this.headerSubtitle,
    required this.child,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.cardBg.withAlpha(240),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor ?? AppColors.border.withAlpha(128),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headerTitle != null)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerTitle!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  if (headerSubtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      headerSubtitle!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
              top: headerTitle != null ? 0 : 24,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
