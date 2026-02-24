import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 Section Header Widget
// সেকশন হেডার উইজেট
//
// Reusable header with title and description.
// পুনরায় ব্যবহারযোগ্য হেডার — টাইটেল ও বর্ণনা সহ।
// ═══════════════════════════════════════════════════════════════════════════
class SectionHeader extends StatelessWidget {
  final String title;
  final String description;

  const SectionHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
