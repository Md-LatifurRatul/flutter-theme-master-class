import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Typography Sample Widget
// টাইপোগ্রাফি স্যাম্পল উইজেট
//
// Shows a single text style with its name, size, and sample text.
// একটি টেক্সট স্টাইল তার নাম, সাইজ, এবং স্যাম্পল টেক্সট সহ দেখায়।
// ═══════════════════════════════════════════════════════════════════════════
class TypographySample extends StatelessWidget {
  final String name;
  final TextStyle style;
  final String sample;
  final String bangla;
  final String usage;

  const TypographySample({
    super.key,
    required this.name,
    required this.style,
    required this.sample,
    required this.bangla,
    required this.usage,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: cs.onPrimaryContainer,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${style.fontSize?.toInt()}px',
                  style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    usage,
                    style: TextStyle(
                      fontSize: 10,
                      color: cs.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text('$sample / $bangla', style: style),
          ],
        ),
      ),
    );
  }
}
