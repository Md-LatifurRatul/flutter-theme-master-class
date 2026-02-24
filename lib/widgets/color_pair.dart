import 'package:flutter/material.dart';
import 'color_box.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Color Pair Widget
// কালার পেয়ার উইজেট
//
// Shows two colors side by side (e.g. primary & onPrimary).
// পাশাপাশি দুটো কালার দেখায় (যেমন primary ও onPrimary)।
// ═══════════════════════════════════════════════════════════════════════════
class ColorPair extends StatelessWidget {
  final String name1;
  final Color color1;
  final String name2;
  final Color color2;

  const ColorPair({
    super.key,
    required this.name1,
    required this.color1,
    required this.name2,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: ColorBox(name: name1, color: color1, textColor: color2)),
          const SizedBox(width: 8),
          Expanded(child: ColorBox(name: name2, color: color2, textColor: color1)),
        ],
      ),
    );
  }
}
