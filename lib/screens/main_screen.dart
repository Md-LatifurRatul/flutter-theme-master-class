import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/theme_masterclass_app.dart';

import 'color_scheme_showcase.dart';
import 'typography_showcase.dart';
import 'component_showcase.dart';
import 'seed_explorer_page.dart';
import 'theme_settings_page.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📱 MAIN SCREEN — Navigation between demo pages
// মেইন স্ক্রিন — ডেমো পেজগুলোর মধ্যে নেভিগেশন
// ═══════════════════════════════════════════════════════════════════════════
class MainScreen extends StatefulWidget {
  final ThemeMasterclassAppState appState;
  const MainScreen({super.key, required this.appState});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ColorSchemeShowcase(appState: widget.appState),
      const TypographyShowcase(),
      const ComponentShowcase(),
      SeedExplorerPage(appState: widget.appState),
      ThemeSettingsPage(appState: widget.appState),
    ];

    return Scaffold(
      // ─────────────────────────────────────────────────────────────────
      // 📱 Scaffold uses `surface` color for background automatically!
      // Scaffold অটোমেটিক `surface` কালার ব্যাকগ্রাউন্ডে ব্যবহার করে!
      // ─────────────────────────────────────────────────────────────────
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        // NavigationBar uses surfaceContainerHigh from ColorScheme!
        // NavigationBar ColorScheme থেকে surfaceContainerHigh ব্যবহার করে!
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette),
            label: 'Colors',
          ),
          NavigationDestination(
            icon: Icon(Icons.text_fields_outlined),
            selectedIcon: Icon(Icons.text_fields),
            label: 'Typography',
          ),
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: 'Components',
          ),
          NavigationDestination(
            icon: Icon(Icons.colorize_outlined),
            selectedIcon: Icon(Icons.colorize),
            label: 'Seed Lab',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
