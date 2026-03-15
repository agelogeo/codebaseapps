import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  bool _mobileMenuOpen = false;
  bool _appsDropdownOpen = false;
  final _appsDropdownKey = GlobalKey();
  OverlayEntry? _dropdownOverlay;

  void _toggleMobileMenu() {
    setState(() {
      _mobileMenuOpen = !_mobileMenuOpen;
    });
  }

  void _showAppsDropdown() {
    _removeDropdownOverlay();
    final renderBox =
        _appsDropdownKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeDropdownOverlay,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            top: offset.dy + size.height + 8,
            left: offset.dx,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.background.withAlpha(240),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _dropdownItem('OCC', '/occ'),
                    _dropdownItem('Keibo', '/keibo'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_dropdownOverlay!);
    setState(() => _appsDropdownOpen = true);
  }

  void _removeDropdownOverlay() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    if (mounted) setState(() => _appsDropdownOpen = false);
  }

  void _resetAndNavigate(String path) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacement(path);
  }

  Widget _dropdownItem(String name, String path) {
    return InkWell(
      onTap: () {
        _removeDropdownOverlay();
        _resetAndNavigate(path);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
          ),
        ),
      ),
    );
  }

  void _scrollToSection(String sectionId) {
    setState(() => _mobileMenuOpen = false);
    // Navigate to home first if not on home page
    final location = GoRouterState.of(context).uri.toString();
    if (location != '/') {
      _resetAndNavigate('/');
      // After navigation, scroll will be handled by the home page
      return;
    }
    _performScroll(sectionId);
  }

  void _performScroll(String sectionId) {
    final key = navScrollKeys[sectionId];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _removeDropdownOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 768;
    final isHomePage = GoRouterState.of(context).uri.toString() == '/';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.background.withAlpha(200),
            border: const Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ColorFilter.mode(
                Colors.black.withAlpha(1),
                BlendMode.srcOver,
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _scrollToSection('home'),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primary,
                                      AppColors.gradientEnd,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.glowColor,
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Codebase Apps',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Desktop nav
                      if (isDesktop)
                        Row(
                          children: [
                            _navButton('Home', () => _scrollToSection('home')),
                            const SizedBox(width: 24),
                            _navButton(
                              'About',
                              () => _scrollToSection('about'),
                            ),
                            if (isHomePage) ...[
                              const SizedBox(width: 24),
                              // Apps dropdown
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  key: _appsDropdownKey,
                                  onTap: () {
                                    if (_appsDropdownOpen) {
                                      _removeDropdownOverlay();
                                    } else {
                                      _showAppsDropdown();
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Apps',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.mutedForeground,
                                        ),
                                      ),
                                      Icon(
                                        _appsDropdownOpen
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        size: 16,
                                        color: AppColors.mutedForeground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      // Mobile menu button
                      if (!isDesktop)
                        IconButton(
                          onPressed: _toggleMobileMenu,
                          icon: Icon(
                            _mobileMenuOpen ? Icons.close : Icons.menu,
                            color: AppColors.foreground,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Mobile menu
        if (_mobileMenuOpen && !isDesktop)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background.withAlpha(240),
              border: const Border(bottom: BorderSide(color: AppColors.border)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _mobileNavButton('Home', () => _scrollToSection('home')),
                _mobileNavButton('About', () => _scrollToSection('about')),
                if (isHomePage) ...[
                  _mobileNavButton('OCC', () {
                    setState(() => _mobileMenuOpen = false);
                    _resetAndNavigate('/occ');
                  }),
                  _mobileNavButton('Keibo', () {
                    setState(() => _mobileMenuOpen = false);
                    _resetAndNavigate('/keibo');
                  }),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _navButton(String label, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
          ),
        ),
      ),
    );
  }

  Widget _mobileNavButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
          ),
        ),
      ),
    );
  }
}

// Global keys for scroll-to-section
final Map<String, GlobalKey> navScrollKeys = {
  'home': GlobalKey(),
  'about': GlobalKey(),
};
