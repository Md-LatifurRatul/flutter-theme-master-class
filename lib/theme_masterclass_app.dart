import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/screens/main_screen.dart';

/// The root of the app. This is where we SET the theme.
/// অ্যাপের মূল। এখানেই আমরা থিম সেট করি।
class ThemeMasterclassApp extends StatefulWidget {
  const ThemeMasterclassApp({super.key});

  @override
  State<ThemeMasterclassApp> createState() => ThemeMasterclassAppState();
}

class ThemeMasterclassAppState extends State<ThemeMasterclassApp> {
  // ─────────────────────────────────────────────────────────────────────────
  // 🎯 STATE: These control the theme!
  // এগুলো থিম কন্ট্রোল করে!
  // ─────────────────────────────────────────────────────────────────────────

  /// The seed color — change this and ALL colors change!
  /// সিড কালার — এটা পাল্টাও আর সব কালার পাল্টে যাবে!
  Color _seedColor = Colors.deepPurple;

  /// Light or Dark mode / লাইট নাকি ডার্ক মোড
  ThemeMode _themeMode = ThemeMode.light;

  /// Whether to use Material 3 / Material 3 ব্যবহার করবে কিনা
  bool _useMaterial3 = true;

  // Public getters so child widgets can read these
  Color get seedColor => _seedColor;
  ThemeMode get themeMode => _themeMode;
  bool get useMaterial3 => _useMaterial3;

  // Methods to change theme state
  void changeSeedColor(Color color) => setState(() => _seedColor = color);
  void changeThemeMode(ThemeMode mode) => setState(() => _themeMode = mode);
  void toggleMaterial3(bool value) => setState(() => _useMaterial3 = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Masterclass',
      debugShowCheckedModeBanner: false,

      // ═══════════════════════════════════════════════════════════════════
      // 🌞 LIGHT THEME — This is used when themeMode is .light or .system
      // লাইট থিম — themeMode যখন .light বা .system তখন এটা ব্যবহার হয়
      // ═══════════════════════════════════════════════════════════════════
      theme: ThemeData(
        // 🎨 ColorScheme.fromSeed — Give it ONE color, get 30+ colors!
        // একটা কালার দাও, ৩০+ কালার পাও!
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light, // ← Light mode! লাইট মোড!
        ),
        useMaterial3: _useMaterial3,
      ),

      // ═══════════════════════════════════════════════════════════════════
      // 🌙 DARK THEME — This is used when themeMode is .dark
      // ডার্ক থিম — themeMode যখন .dark তখন এটা ব্যবহার হয়
      // ═══════════════════════════════════════════════════════════════════
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor, // ← SAME seed! একই seed!
          brightness: Brightness.dark, // ← Dark mode! ডার্ক মোড!
        ),
        useMaterial3: _useMaterial3,
      ),

      // ═══════════════════════════════════════════════════════════════════
      // 🔄 THEME MODE — Which theme to use?
      // কোন থিম ব্যবহার করবে?
      // ThemeMode.light  → Always light (সবসময় লাইট)
      // ThemeMode.dark   → Always dark (সবসময় ডার্ক)
      // ThemeMode.system → Follow phone setting (ফোন সেটিং follow)
      // ═══════════════════════════════════════════════════════════════════
      themeMode: _themeMode,

      home: MainScreen(appState: this),
    );
  }
}
