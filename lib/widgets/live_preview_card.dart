import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Live Preview Card Widget
// লাইভ প্রিভিউ কার্ড উইজেট
//
// Shows a mini preview of how the current theme looks on real widgets.
// বর্তমান থিম আসল widget-এ কেমন দেখায় তার একটি মিনি প্রিভিউ দেখায়।
// ═══════════════════════════════════════════════════════════════════════════
class LivePreviewCard extends StatelessWidget {
  const LivePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mini app bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: cs.onSurface),
                  const SizedBox(width: 16),
                  Text(
                    'Preview AppBar',
                    style: TextStyle(
                      color: cs.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Mini card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Title / কার্ড টাইটেল',
                    style: TextStyle(
                      color: cs.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Subtitle text / সাবটাইটেল',
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Mini buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton(onPressed: () {}, child: const Text('Primary')),
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Text('Tonal'),
                ),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              ],
            ),
            const SizedBox(height: 12),

            // Mini FAB
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
