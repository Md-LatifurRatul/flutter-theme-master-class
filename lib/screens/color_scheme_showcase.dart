import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/theme_masterclass_app.dart';
import '../widgets/section_header.dart';
import '../widgets/seed_display.dart';
import '../widgets/color_pair.dart';
import '../widgets/color_box.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 🎨 PAGE 1: COLOR SCHEME SHOWCASE
// পেজ ১: কালার স্কিম শোকেস
//
// Hey! This page shows you EVERY color in the ColorScheme.
// হেই! এই পেজ তোমাকে ColorScheme-র প্রতিটি কালার দেখাবে।
//
// Each box shows: color name, hex value, and the matching "on" color for text.
// প্রতিটি বক্স দেখায়: কালারের নাম, হেক্স মান, এবং টেক্সটের জন্য ম্যাচিং "on" কালার।
// ═══════════════════════════════════════════════════════════════════════════
class ColorSchemeShowcase extends StatelessWidget {
  final ThemeMasterclassAppState appState;
  const ColorSchemeShowcase({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // ↑ This is how you ACCESS the ColorScheme from anywhere!
    // ↑ যেকোনো জায়গা থেকে এভাবে ColorScheme অ্যাক্সেস করো!

    return Scaffold(
      appBar: AppBar(
        // In M3, AppBar uses surface color (not primary!)
        // M3-তে AppBar surface কালার ব্যবহার করে (primary না!)
        title: const Text('🎨 Color Scheme / কালার স্কিম'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── SECTION HEADER ──
          const SectionHeader(
            title: 'Current Seed / বর্তমান সিড',
            description:
                'All colors below are generated from this ONE seed color!\n'
                'নিচের সব কালার এই একটা seed কালার থেকে তৈরি!',
          ),
          SeedDisplay(seedColor: appState.seedColor),
          const SizedBox(height: 24),

          // ── PRIMARY COLORS ──
          const SectionHeader(
            title: '🎯 Primary Colors / প্রাইমারি কালার',
            description:
                'The MAIN brand colors. Used in important buttons, FAB, active states.\n'
                'মেইন ব্র্যান্ড কালার। গুরুত্বপূর্ণ বাটন, FAB, অ্যাক্টিভ স্টেট-এ ব্যবহার হয়।',
          ),
          ColorPair(
            name1: 'primary',
            color1: cs.primary,
            name2: 'onPrimary',
            color2: cs.onPrimary,
          ),
          ColorPair(
            name1: 'primaryContainer',
            color1: cs.primaryContainer,
            name2: 'onPrimaryContainer',
            color2: cs.onPrimaryContainer,
          ),
          ColorBox(
            name: 'primaryFixed',
            color: cs.primaryFixed,
            textColor: cs.onPrimaryFixed,
          ),
          ColorBox(
            name: 'primaryFixedDim',
            color: cs.primaryFixedDim,
            textColor: cs.onPrimaryFixedVariant,
          ),
          const SizedBox(height: 24),

          // ── SECONDARY COLORS ──
          const SectionHeader(
            title: '🌟 Secondary Colors / সেকেন্ডারি কালার',
            description:
                'Supporting accent color. Used in filter chips, toggles, less important buttons.\n'
                'সহায়ক অ্যাকসেন্ট কালার। ফিল্টার চিপ, টগল, কম গুরুত্বপূর্ণ বাটনে ব্যবহার হয়।',
          ),
          ColorPair(
            name1: 'secondary',
            color1: cs.secondary,
            name2: 'onSecondary',
            color2: cs.onSecondary,
          ),
          ColorPair(
            name1: 'secondaryContainer',
            color1: cs.secondaryContainer,
            name2: 'onSecondaryContainer',
            color2: cs.onSecondaryContainer,
          ),
          const SizedBox(height: 24),

          // ── TERTIARY COLORS ──
          const SectionHeader(
            title: '🎭 Tertiary Colors / টারশিয়ারি কালার',
            description:
                'Third color for contrast. Adds visual interest and variety.\n'
                'কনট্রাস্টের জন্য তৃতীয় কালার। ভিজ্যুয়াল আগ্রহ এবং বৈচিত্র্য যোগ করে।',
          ),
          ColorPair(
            name1: 'tertiary',
            color1: cs.tertiary,
            name2: 'onTertiary',
            color2: cs.onTertiary,
          ),
          ColorPair(
            name1: 'tertiaryContainer',
            color1: cs.tertiaryContainer,
            name2: 'onTertiaryContainer',
            color2: cs.onTertiaryContainer,
          ),
          const SizedBox(height: 24),

          // ── ERROR COLORS ──
          const SectionHeader(
            title: '🔴 Error Colors / এরর কালার',
            description:
                'ALWAYS red-ish, even with fromSeed! Used for errors, warnings, delete buttons.\n'
                'সবসময় লালচে, fromSeed দিলেও! এরর, সতর্কতা, ডিলিট বাটনে ব্যবহার হয়।',
          ),
          ColorPair(
            name1: 'error',
            color1: cs.error,
            name2: 'onError',
            color2: cs.onError,
          ),
          ColorPair(
            name1: 'errorContainer',
            color1: cs.errorContainer,
            name2: 'onErrorContainer',
            color2: cs.onErrorContainer,
          ),
          const SizedBox(height: 24),

          // ── SURFACE COLORS ──
          const SectionHeader(
            title: '📄 Surface Colors / সারফেস কালার',
            description:
                'The BACKGROUND family! Scaffold, Cards, Dialogs — all use surface colors.\n'
                'ব্যাকগ্রাউন্ড পরিবার! Scaffold, Card, Dialog — সব সারফেস কালার ব্যবহার করে।',
          ),
          ColorPair(
            name1: 'surface',
            color1: cs.surface,
            name2: 'onSurface',
            color2: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceDim',
            color: cs.surfaceDim,
            textColor: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceBright',
            color: cs.surfaceBright,
            textColor: cs.onSurface,
          ),
          const SizedBox(height: 16),

          // ── SURFACE CONTAINER LEVELS ──
          const SectionHeader(
            title: '📊 Surface Containers / সারফেস কন্টেইনার',
            description:
                'M3 replaces elevation-shadows with these levels! Higher = more prominent.\n'
                'M3 elevation-shadow-কে এই লেভেলগুলো দিয়ে রিপ্লেস করে! উচ্চতর = বেশি প্রমিনেন্ট।',
          ),
          ColorBox(
            name: 'surfaceContainerLowest',
            color: cs.surfaceContainerLowest,
            textColor: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceContainerLow',
            color: cs.surfaceContainerLow,
            textColor: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceContainer',
            color: cs.surfaceContainer,
            textColor: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceContainerHigh',
            color: cs.surfaceContainerHigh,
            textColor: cs.onSurface,
          ),
          ColorBox(
            name: 'surfaceContainerHighest',
            color: cs.surfaceContainerHighest,
            textColor: cs.onSurface,
          ),
          const SizedBox(height: 24),

          // ── OUTLINE & SPECIAL COLORS ──
          const SectionHeader(
            title: '📏 Outline & Special / আউটলাইন ও বিশেষ',
            description:
                'Borders, dividers, shadows, overlays.\n'
                'বর্ডার, ডিভাইডার, ছায়া, ওভারলে।',
          ),
          ColorBox(name: 'outline', color: cs.outline, textColor: cs.surface),
          ColorBox(
            name: 'outlineVariant',
            color: cs.outlineVariant,
            textColor: cs.onSurface,
          ),
          ColorPair(
            name1: 'inverseSurface',
            color1: cs.inverseSurface,
            name2: 'onInverseSurface',
            color2: cs.onInverseSurface,
          ),
          ColorBox(
            name: 'inversePrimary',
            color: cs.inversePrimary,
            textColor: cs.onSurface,
          ),
          ColorBox(name: 'shadow', color: cs.shadow, textColor: Colors.white),
          ColorBox(name: 'scrim', color: cs.scrim, textColor: Colors.white),
          const SizedBox(height: 32),

          // ── ON COLORS EXPLANATION ──
          Card(
            color: cs.tertiaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 "on" কালার কী? / What are "on" colors?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: cs.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hey! "on" colors are for TEXT and ICONS that sit ON TOP of a color.\n'
                    'যখন তুমি primary কালারের বাটন বানাও, বাটনের টেক্সট কোন রঙের হবে? '
                    'onPrimary কালারের!\n\n'
                    'Rule / নিয়ম:\n'
                    '• primary bg → onPrimary text\n'
                    '• surface bg → onSurface text\n'
                    '• error bg → onError text\n'
                    '• primaryContainer bg → onPrimaryContainer text\n\n'
                    'NEVER mix them! primary bg + onSurface text = UNREADABLE!\n'
                    'কখনো মিক্স কোরো না! primary bg + onSurface text = পড়া যাবে না!',
                    style: TextStyle(color: cs.onTertiaryContainer),
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
}
