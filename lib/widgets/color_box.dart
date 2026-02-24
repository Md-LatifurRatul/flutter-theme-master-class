import 'package:flutter/material.dart';
import '../utils/color_utils.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Color Box Widget
// কালার বক্স উইজেট
//
// Displays a single color with its name and hex value.
// একটি কালার তার নাম ও হেক্স মান সহ দেখায়।
// ═══════════════════════════════════════════════════════════════════════════
class ColorBox extends StatelessWidget {
  final String name;
  final Color color;
  final Color textColor;

  const ColorBox({
    super.key,
    required this.name,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              colorToHex(color),
              style: TextStyle(
                color: textColor.withValues(alpha: 0.8),
                fontSize: 10,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
