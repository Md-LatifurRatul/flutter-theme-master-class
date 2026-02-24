import 'package:flutter/material.dart';
import 'package:flutter_theme_masterclass/theme_masterclass_app.dart';
import '../widgets/live_preview_card.dart';
import '../widgets/generated_palette.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 🧪 PAGE 4: SEED EXPLORER
// পেজ ৪: সিড এক্সপ্লোরার
//
// Hey! Change the seed color and watch ALL colors change live!
// হেই! সিড কালার পাল্টাও আর সব কালার লাইভ পাল্টাতে দেখো!
// ═══════════════════════════════════════════════════════════════════════════
class SeedExplorerPage extends StatelessWidget {
  final ThemeMasterclassAppState appState;
  const SeedExplorerPage({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final seedOptions = <MapEntry<String, Color>>[
      const MapEntry('Deep Purple / গাঢ় বেগুনি', Colors.deepPurple),
      const MapEntry('Blue / নীল', Colors.blue),
      const MapEntry('Teal / টিল', Colors.teal),
      const MapEntry('Green / সবুজ', Colors.green),
      const MapEntry('Orange / কমলা', Colors.orange),
      const MapEntry('Red / লাল', Colors.red),
      const MapEntry('Pink / গোলাপি', Colors.pink),
      const MapEntry('Indigo / ঘন নীল', Colors.indigo),
      const MapEntry('Cyan / সায়ান', Colors.cyan),
      const MapEntry('Amber / অ্যাম্বার', Colors.amber),
      const MapEntry('Brown / বাদামি', Colors.brown),
      const MapEntry('Lime / লাইম', Colors.lime),
      MapEntry('Custom / কাস্টম', const Color(0xFF6750A4)),
      MapEntry('Instagram / ইনস্টাগ্রাম', const Color(0xFFE1306C)),
      MapEntry('WhatsApp / হোয়াটসঅ্যাপ', const Color(0xFF25D366)),
      MapEntry('YouTube / ইউটিউব', const Color(0xFFFF0000)),
      MapEntry('Spotify / স্পটিফাই', const Color(0xFF1DB954)),
      MapEntry('Twitter/X / টুইটার', const Color(0xFF1DA1F2)),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('🧪 Seed Explorer / সিড এক্সপ্লোরার')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // How it works
          Card(
            color: cs.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 How it works / কীভাবে কাজ করে:',
                    style: textTheme.titleSmall?.copyWith(
                      color: cs.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hey! Tap any color below and the ENTIRE app changes!\n'
                    'Flutter generates 30+ harmonious colors from ONE seed.\n\n'
                    'হেই! নিচের যেকোনো কালারে ট্যাপ করো আর পুরো অ্যাপ পাল্টে যাবে!\n'
                    'Flutter একটা seed থেকে ৩০+ সুসংগত কালার তৈরি করে।',
                    style: TextStyle(color: cs.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            '🎨 Pick a Seed Color / সিড কালার বাছো:',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Color grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.3,
            ),
            itemCount: seedOptions.length,
            itemBuilder: (context, index) {
              final entry = seedOptions[index];
              final isSelected =
                  appState.seedColor.toARGB32() == entry.value.toARGB32();

              return GestureDetector(
                onTap: () => appState.changeSeedColor(entry.value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: entry.value,
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
                        ? Border.all(color: cs.onSurface, width: 3)
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: entry.value.withValues(alpha: 0.5),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isSelected)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                      const SizedBox(height: 4),
                      Text(
                        entry.key.split(' / ')[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black54),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        entry.key.split(' / ').last,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 9,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black54),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // ── LIVE PREVIEW ──
          Text(
            '👀 Live Preview / লাইভ প্রিভিউ:',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'This updates when you change the seed above!\n'
            'উপরে seed পাল্টালে এটা আপডেট হয়!',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),

          // Preview card
          const LivePreviewCard(),
          const SizedBox(height: 16),

          // Generated palette
          const GeneratedPalette(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
