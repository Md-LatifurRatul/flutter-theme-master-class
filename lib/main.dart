import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/theme_masterclass_app.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 🎨 Flutter Theme Masterclass — Complete Visual Demo App
// ফ্লাটার থিম মাস্টারক্লাস — সম্পূর্ণ ভিজ্যুয়াল ডেমো অ্যাপ
//
// This app teaches you EVERYTHING about Flutter themes visually!
// এই অ্যাপ তোমাকে Flutter থিম সম্পর্কে সব কিছু ভিজ্যুয়ালি শেখাবে!
//
// 📁 Project Structure / প্রজেক্ট স্ট্রাকচার:
// lib/
//   main.dart                → App root + State (এই ফাইল)
//   utils/color_utils.dart   → Hex color utility
//   screens/
//     main_screen.dart       → Navigation bar + tab switching
//     color_scheme_showcase.dart → All 30+ ColorScheme colors
//     typography_showcase.dart   → All 15 text styles
//     component_showcase.dart    → Buttons, Cards, Chips, etc.
//     seed_explorer_page.dart    → Dynamic seed color picker
//     theme_settings_page.dart   → Theme mode & M2/M3 toggle
//   widgets/
//     section_header.dart    → Reusable section header
//     seed_display.dart      → Seed color display card
//     color_box.dart         → Single color box
//     color_pair.dart        → Side-by-side color pair
//     typography_category.dart → Typography category header
//     typography_sample.dart   → Single text style sample
//     live_preview_card.dart   → Mini preview of themed widgets
//     generated_palette.dart   → Generated palette grid
//     ref_item.dart            → Quick reference row
// ═══════════════════════════════════════════════════════════════════════════

void main() {
  // 🏁 App starts here! / অ্যাপ এখান থেকে শুরু!
  runApp(const ThemeMasterclassApp());
}
