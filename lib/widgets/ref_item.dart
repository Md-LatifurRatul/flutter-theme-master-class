import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Ref Item Widget
// রেফ আইটেম উইজেট
//
// Quick reference row with title & description.
// দ্রুত রেফারেন্স সারি — টাইটেল ও বর্ণনা সহ।
// ═══════════════════════════════════════════════════════════════════════════
class RefItem extends StatelessWidget {
  final ColorScheme colorScheme;
  final String title;
  final String description;

  const RefItem({
    super.key,
    required this.colorScheme,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: colorScheme.onTertiaryContainer,
              ),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 12, color: colorScheme.onTertiaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
