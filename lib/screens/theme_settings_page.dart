import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/theme_masterclass_app.dart';
import '../widgets/ref_item.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ⚙️ PAGE 5: SETTINGS
// পেজ ৫: সেটিংস
//
// Hey! Toggle light/dark mode and M2/M3 here!
// হেই! এখানে লাইট/ডার্ক মোড এবং M2/M3 টগল করো!
// ═══════════════════════════════════════════════════════════════════════════
class ThemeSettingsPage extends StatelessWidget {
  final ThemeMasterclassAppState appState;
  const ThemeSettingsPage({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('⚙️ Settings / সেটিংস')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── THEME MODE ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🌓 Theme Mode / থিম মোড',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hey! Switch between modes and watch ALL colors change!\n'
                    'হেই! মোড সুইচ করো আর দেখো সব কালার পাল্টে যায়!',
                    style: textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SegmentedButton<ThemeMode>(
                    segments: const [
                      ButtonSegment(
                        value: ThemeMode.light,
                        icon: Icon(Icons.light_mode),
                        label: Text('Light'),
                      ),
                      ButtonSegment(
                        value: ThemeMode.system,
                        icon: Icon(Icons.brightness_auto),
                        label: Text('System'),
                      ),
                      ButtonSegment(
                        value: ThemeMode.dark,
                        icon: Icon(Icons.dark_mode),
                        label: Text('Dark'),
                      ),
                    ],
                    selected: {appState.themeMode},
                    onSelectionChanged: (modes) {
                      appState.changeThemeMode(modes.first);
                    },
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getThemeModeExplanation(appState.themeMode),
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── MATERIAL VERSION ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🎨 Material Version / ম্যাটেরিয়াল ভার্সন',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Toggle between Material 2 and 3 to see differences!\n'
                    'M2 ও M3 এর মধ্যে টগল করে পার্থক্য দেখো!',
                    style: textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: Text(
                      appState.useMaterial3
                          ? 'Material 3 (New! / নতুন!) ✅'
                          : 'Material 2 (Old / পুরনো)',
                    ),
                    subtitle: Text(
                      appState.useMaterial3
                          ? 'Rounded corners, color roles, dynamic color\n'
                                'গোলাকার কোণা, কালার রোল, ডাইনামিক কালার'
                          : 'Sharp corners, primarySwatch, elevation shadows\n'
                                'তীক্ষ্ণ কোণা, primarySwatch, elevation ছায়া',
                    ),
                    value: appState.useMaterial3,
                    onChanged: appState.toggleMaterial3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── QUICK REFERENCE ──
          Card(
            color: cs.tertiaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📚 Quick Reference / দ্রুত রেফারেন্স',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RefItem(
                    colorScheme: cs,
                    title: '🏗️ ThemeData',
                    description: 'The whole theme config / সম্পূর্ণ থিম কনফিগ',
                  ),
                  RefItem(
                    colorScheme: cs,
                    title: '🎨 ColorScheme',
                    description: 'All color roles (30+) / সব কালার রোল',
                  ),
                  RefItem(
                    colorScheme: cs,
                    title: '🌱 fromSeed()',
                    description: '1 color → 30+ colors / ১টা → ৩০+',
                  ),
                  RefItem(
                    colorScheme: cs,
                    title: '📝 TextTheme',
                    description: '15 text styles / ১৫টা টেক্সট স্টাইল',
                  ),
                  RefItem(
                    colorScheme: cs,
                    title: '🌓 ThemeMode',
                    description: 'light / dark / system',
                  ),
                  RefItem(
                    colorScheme: cs,
                    title: '✅ Best Practice',
                    description: 'Theme.of(context).colorScheme.xxx',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── BEST CODE PATTERN ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💻 Best Practice Code / সেরা কোড প্যাটার্ন',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '// ✅ BEST: Create a theme file!\n'
                      '// সেরা: আলাদা থিম ফাইল বানাও!\n'
                      '\n'
                      '// lib/theme/app_theme.dart\n'
                      'class AppTheme {\n'
                      '  static const seed = Colors.deepPurple;\n'
                      '\n'
                      '  static ThemeData get light => ThemeData(\n'
                      '    colorScheme: ColorScheme.fromSeed(\n'
                      '      seedColor: seed,\n'
                      '      brightness: Brightness.light,\n'
                      '    ),\n'
                      '    useMaterial3: true,\n'
                      '  );\n'
                      '\n'
                      '  static ThemeData get dark => ThemeData(\n'
                      '    colorScheme: ColorScheme.fromSeed(\n'
                      '      seedColor: seed,\n'
                      '      brightness: Brightness.dark,\n'
                      '    ),\n'
                      '    useMaterial3: true,\n'
                      '  );\n'
                      '}\n'
                      '\n'
                      '// main.dart\n'
                      'MaterialApp(\n'
                      '  theme: AppTheme.light,\n'
                      '  darkTheme: AppTheme.dark,\n'
                      '  themeMode: ThemeMode.system,\n'
                      ')',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── ACCESS THEME ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🔑 Accessing Theme / থিম অ্যাক্সেস',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '// 🎨 Color scheme পাও:\n'
                      'final cs = Theme.of(context).colorScheme;\n'
                      '// Use: cs.primary, cs.surface, etc.\n'
                      '\n'
                      '// ✏️ Text theme পাও:\n'
                      'final tt = Theme.of(context).textTheme;\n'
                      '// Use: tt.bodyLarge, tt.titleMedium\n'
                      '\n'
                      '// 🌓 Dark mode চেক:\n'
                      'final isDark = Theme.of(context)\n'
                      '    .brightness == Brightness.dark;\n'
                      '\n'
                      '// 🧩 Extension shortcut:\n'
                      '// extension on BuildContext {\n'
                      '//   ColorScheme get cs =>\n'
                      '//       Theme.of(this).colorScheme;\n'
                      '// }\n'
                      '// Usage: context.cs.primary ✅',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── COMMON MISTAKES ──
          Card(
            color: cs.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '⚠️ Common Mistakes / সাধারণ ভুল',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onErrorContainer,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '❌ Colors.blue → থিমের সাথে পাল্টায় না!\n'
                    '✅ cs.primary → থিম পাল্টালে পাল্টায়!\n\n'
                    '❌ TextStyle(fontSize: 16) → ম্যানুয়াল!\n'
                    '✅ textTheme.bodyLarge → থিম follow!\n\n'
                    '❌ primary bg + onSurface text → পড়া যায় না!\n'
                    '✅ primary bg + onPrimary text → পারফেক্ট!\n\n'
                    '❌ primarySwatch (M2, deprecated!)\n'
                    '✅ ColorScheme.fromSeed (M3!)\n\n'
                    '❌ accentColor (deprecated!)\n'
                    '✅ colorScheme.secondary',
                    style: TextStyle(
                      color: cs.onErrorContainer,
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _getThemeModeExplanation(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return '☀️ LIGHT MODE / লাইট মোড\n'
            '• surface → near white / প্রায় সাদা\n'
            '• onSurface → near black / প্রায় কালো\n'
            '• primary → darker shade / গাঢ় শেড\n'
            '• Great for daytime / দিনে ভালো';
      case ThemeMode.dark:
        return '🌙 DARK MODE / ডার্ক মোড\n'
            '• surface → near black / প্রায় কালো\n'
            '• onSurface → near white / প্রায় সাদা\n'
            '• primary → lighter shade / হালকা শেড\n'
            '• Great for nighttime / রাতে ভালো';
      case ThemeMode.system:
        return '🔄 SYSTEM MODE / সিস্টেম মোড\n'
            '• Follows phone setting / ফোন সেটিং follow\n'
            '• Auto light/dark / অটো লাইট/ডার্ক\n'
            '• Best for users / ইউজারদের জন্য সেরা';
    }
  }
}
