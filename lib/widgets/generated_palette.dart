import 'package:flutter/material.dart';
import '../utils/color_utils.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Generated Palette Widget
// জেনারেটেড প্যালেট উইজেট
//
// Displays the generated color palette from the current seed.
// বর্তমান seed থেকে তৈরি কালার প্যালেট দেখায়।
// ═══════════════════════════════════════════════════════════════════════════
class GeneratedPalette extends StatelessWidget {
  const GeneratedPalette({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final colors = [
      ('primary', cs.primary),
      ('primaryCont.', cs.primaryContainer),
      ('secondary', cs.secondary),
      ('secondaryCont.', cs.secondaryContainer),
      ('tertiary', cs.tertiary),
      ('tertiaryCont.', cs.tertiaryContainer),
      ('surface', cs.surface),
      ('surfaceCont.', cs.surfaceContainer),
      ('error', cs.error),
      ('errorCont.', cs.errorContainer),
      ('outline', cs.outline),
      ('inverseSurface', cs.inverseSurface),
    ];

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎨 Generated Palette / তৈরি প্যালেট',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: colors.map((c) {
                return Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: c.$2,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: cs.outlineVariant,
                          width: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 56,
                      child: Text(
                        c.$1,
                        style: const TextStyle(fontSize: 7),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      colorToHex(c.$2),
                      style: TextStyle(
                        fontSize: 7,
                        fontFamily: 'monospace',
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
