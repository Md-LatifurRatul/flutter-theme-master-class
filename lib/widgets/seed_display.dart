import 'package:flutter/material.dart';
import '../utils/color_utils.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Seed Display Widget
// সিড ডিসপ্লে উইজেট
//
// Shows the current seed color with its hex value and a tip.
// বর্তমান সিড কালার তার হেক্স মান ও টিপ সহ দেখায়।
// ═══════════════════════════════════════════════════════════════════════════
class SeedDisplay extends StatelessWidget {
  final Color seedColor;

  const SeedDisplay({super.key, required this.seedColor});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: seedColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cs.outline),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seed Color / সিড কালার',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    colorToHex(seedColor),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'monospace',
                      color: cs.primary,
                    ),
                  ),
                  Text(
                    'Go to "Seed Lab" tab to change! / "Seed Lab" ট্যাবে গিয়ে পাল্টাও!',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
