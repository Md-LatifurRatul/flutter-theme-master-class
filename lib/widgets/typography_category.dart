import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Typography Category Widget
// টাইপোগ্রাফি ক্যাটাগরি উইজেট
//
// Category header for typography sections (Display, Headline, etc.)
// টাইপোগ্রাফি সেকশনের জন্য ক্যাটাগরি হেডার (Display, Headline, ইত্যাদি)
// ═══════════════════════════════════════════════════════════════════════════
class TypographyCategory extends StatelessWidget {
  final String title;

  const TypographyCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
