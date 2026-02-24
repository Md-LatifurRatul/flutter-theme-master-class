import 'package:flutter/material.dart';
import '../widgets/typography_category.dart';
import '../widgets/typography_sample.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ✏️ PAGE 2: TYPOGRAPHY SHOWCASE
// পেজ ২: টাইপোগ্রাফি শোকেস
//
// Hey! This shows you EVERY text style in Material 3.
// হেই! এটা তোমাকে Material 3-র প্রতিটি টেক্সট স্টাইল দেখাবে।
// ═══════════════════════════════════════════════════════════════════════════
class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('✏️ Typography / টাইপোগ্রাফি')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Usage tip card
          Card(
            color: cs.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 How to use / কীভাবে ব্যবহার করবে:',
                    style: textTheme.titleSmall?.copyWith(
                      color: cs.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Theme.of(context).textTheme.bodyLarge\n\n'
                    'NEVER do: TextStyle(fontSize: 16) ❌\n'
                    'ALWAYS do: textTheme.bodyLarge ✅\n\n'
                    'কখনো করো না: TextStyle(fontSize: 16) ❌\n'
                    'সবসময় করো: textTheme.bodyLarge ✅',
                    style: TextStyle(
                      color: cs.onPrimaryContainer,
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── DISPLAY ──
          const TypographyCategory(title: '🖥️ Display — Hero/Movie-poster text'),
          TypographySample(
            name: 'displayLarge',
            style: textTheme.displayLarge!,
            sample: 'Giant title',
            bangla: 'অনেক বড়',
            usage: 'Hero sections',
          ),
          TypographySample(
            name: 'displayMedium',
            style: textTheme.displayMedium!,
            sample: 'Big heading',
            bangla: 'বড় হেডিং',
            usage: 'Full screen messages',
          ),
          TypographySample(
            name: 'displaySmall',
            style: textTheme.displaySmall!,
            sample: 'Section title',
            bangla: 'সেকশন',
            usage: 'Important section headers',
          ),
          const SizedBox(height: 24),

          // ── HEADLINE ──
          const TypographyCategory(title: '📰 Headline — Page/Card titles'),
          TypographySample(
            name: 'headlineLarge',
            style: textTheme.headlineLarge!,
            sample: 'Page title',
            bangla: 'পেজ টাইটেল',
            usage: 'Top of page titles',
          ),
          TypographySample(
            name: 'headlineMedium',
            style: textTheme.headlineMedium!,
            sample: 'Card title',
            bangla: 'কার্ড',
            usage: 'Card headers',
          ),
          TypographySample(
            name: 'headlineSmall',
            style: textTheme.headlineSmall!,
            sample: 'Dialog title',
            bangla: 'ডায়ালগ',
            usage: 'Dialog/sheet headers',
          ),
          const SizedBox(height: 24),

          // ── TITLE ──
          const TypographyCategory(title: '📋 Title — AppBar/Tab labels'),
          TypographySample(
            name: 'titleLarge',
            style: textTheme.titleLarge!,
            sample: 'AppBar title',
            bangla: 'অ্যাপবার',
            usage: 'AppBar, important labels',
          ),
          TypographySample(
            name: 'titleMedium',
            style: textTheme.titleMedium!,
            sample: 'List tile title',
            bangla: 'লিস্ট',
            usage: 'List item titles, tabs',
          ),
          TypographySample(
            name: 'titleSmall',
            style: textTheme.titleSmall!,
            sample: 'Sub-section',
            bangla: 'সাব-সেকশন',
            usage: 'Small section headers',
          ),
          const SizedBox(height: 24),

          // ── BODY ── (MOST USED!)
          const TypographyCategory(title: '📝 Body — Main readable text  ⭐ MOST USED!'),
          TypographySample(
            name: 'bodyLarge',
            style: textTheme.bodyLarge!,
            sample: 'Important body text',
            bangla: 'গুরুত্বপূর্ণ',
            usage: 'Emphasized paragraphs',
          ),
          TypographySample(
            name: 'bodyMedium',
            style: textTheme.bodyMedium!,
            sample: 'Regular paragraph',
            bangla: 'সাধারণ',
            usage: 'Default text, descriptions',
          ),
          TypographySample(
            name: 'bodySmall',
            style: textTheme.bodySmall!,
            sample: 'Small support text',
            bangla: 'ছোট',
            usage: 'Timestamps, captions',
          ),
          const SizedBox(height: 24),

          // ── LABEL ──
          const TypographyCategory(title: '🏷️ Label — Buttons/Chips/Navigation'),
          TypographySample(
            name: 'labelLarge',
            style: textTheme.labelLarge!,
            sample: 'BUTTON TEXT',
            bangla: 'বাটন',
            usage: 'Button labels, prominent links',
          ),
          TypographySample(
            name: 'labelMedium',
            style: textTheme.labelMedium!,
            sample: 'Navigation label',
            bangla: 'নেভিগেশন',
            usage: 'Bottom nav, tab labels',
          ),
          TypographySample(
            name: 'labelSmall',
            style: textTheme.labelSmall!,
            sample: 'Chip text',
            bangla: 'চিপ',
            usage: 'Chips, small labels',
          ),
          const SizedBox(height: 32),

          // ── COLORING TEXT ──
          Card(
            color: cs.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🎨 Coloring Text / টেক্সটে কালার দেওয়া',
                    style: textTheme.titleSmall?.copyWith(
                      color: cs.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hey! Want to change text color while keeping the style?'
                    ' Use copyWith!\n'
                    'হেই! স্টাইল রেখে শুধু কালার পাল্টাতে চাও? copyWith ব্যবহার করো!',
                    style: TextStyle(color: cs.onSecondaryContainer),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'textTheme.bodyLarge?.copyWith(\n'
                      '  color: colorScheme.primary,\n'
                      ')',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Primary color text / প্রাইমারি কালার',
                    style: textTheme.bodyLarge?.copyWith(color: cs.primary),
                  ),
                  Text(
                    'Error color text / এরর কালার',
                    style: textTheme.bodyLarge?.copyWith(color: cs.error),
                  ),
                  Text(
                    'Tertiary color text / টারশিয়ারি কালার',
                    style: textTheme.bodyLarge?.copyWith(color: cs.tertiary),
                  ),
                  Text(
                    'onSurfaceVariant / সাবটেল টেক্সট',
                    style: textTheme.bodyLarge?.copyWith(
                      color: cs.onSurfaceVariant,
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
}
