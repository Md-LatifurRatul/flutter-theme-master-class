import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 🔘 PAGE 3: COMPONENT SHOWCASE
// পেজ ৩: কম্পোনেন্ট শোকেস
//
// Hey! This shows how theme affects REAL widgets!
// হেই! এটা দেখায় থিম কীভাবে আসল widget-গুলোকে প্রভাবিত করে!
// ═══════════════════════════════════════════════════════════════════════════
class ComponentShowcase extends StatefulWidget {
  const ComponentShowcase({super.key});

  @override
  State<ComponentShowcase> createState() => _ComponentShowcaseState();
}

class _ComponentShowcaseState extends State<ComponentShowcase> {
  bool _switchValue = true;
  bool _checkboxValue = true;
  double _sliderValue = 0.6;
  int _selectedChip = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('🔘 Components / কম্পোনেন্ট')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ═══════════════════════════════════════════════════════════════
          // 🔘 BUTTONS
          // ═══════════════════════════════════════════════════════════════
          Text('🔘 Buttons / বাটন', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Each button type has different importance. Filled = most important.\n'
            'প্রতিটি বাটনের ধরনের আলাদা গুরুত্ব। Filled = সবচেয়ে গুরুত্বপূর্ণ।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),

          // Button Types
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(
                // 🎯 Uses: primary bg + onPrimary text
                onPressed: () {},
                child: const Text('Filled (Most!)'),
              ),
              FilledButton.tonal(
                // 🎯 Uses: secondaryContainer bg + onSecondaryContainer text
                onPressed: () {},
                child: const Text('Filled Tonal'),
              ),
              ElevatedButton(
                // 🎯 Uses: surface bg + primary text, with slight elevation
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                // 🎯 Uses: outline border + primary text
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              TextButton(
                // 🎯 Uses: primary text, no background
                onPressed: () {},
                child: const Text('Text'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Disabled buttons
          Text(
            'Disabled / নিষ্ক্রিয়:',
            style: textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(onPressed: null, child: Text('Filled')),
              OutlinedButton(onPressed: null, child: Text('Outlined')),
              TextButton(onPressed: null, child: Text('Text')),
            ],
          ),
          const SizedBox(height: 8),

          // Icon buttons
          Text(
            'Icon Buttons / আইকন বাটন:',
            style: textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 🃏 CARDS
          // ═══════════════════════════════════════════════════════════════
          Text('🃏 Cards / কার্ড', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Cards use surface colors. 3 variants with different emphasis.\n'
            'কার্ড সারফেস কালার ব্যবহার করে। ৩টি ভ্যারিয়েন্ট।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card, color: cs.primary),
              title: const Text('Card (Elevated)'),
              subtitle: const Text('surfaceContainerLow bg with shadow'),
            ),
          ),
          Card.filled(
            child: ListTile(
              leading: Icon(Icons.credit_card, color: cs.primary),
              title: const Text('Card.filled'),
              subtitle: const Text('surfaceContainerHighest bg'),
            ),
          ),
          Card.outlined(
            child: ListTile(
              leading: Icon(Icons.credit_card, color: cs.primary),
              title: const Text('Card.outlined'),
              subtitle: const Text('surface bg + outline border'),
            ),
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 🏷️ CHIPS
          // ═══════════════════════════════════════════════════════════════
          Text('🏷️ Chips / চিপ', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Selected chips use secondaryContainer.\n'
            'সিলেক্টেড চিপ secondaryContainer ব্যবহার করে।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (int i = 0; i < 4; i++)
                FilterChip(
                  label: Text(['All', 'Music', 'Sports', 'News'][i]),
                  selected: _selectedChip == i,
                  onSelected: (v) => setState(() => _selectedChip = i),
                ),
              const InputChip(
                label: Text('Input Chip'),
                avatar: Icon(Icons.tag),
              ),
              ActionChip(label: const Text('Action Chip'), onPressed: () {}),
            ],
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 🔲 TEXT FIELDS
          // ═══════════════════════════════════════════════════════════════
          Text('🔲 Text Fields / টেক্সট ফিল্ড', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Border uses outline color. Focused border uses primary.\n'
            'বর্ডার outline ব্যবহার করে, ফোকাসড বর্ডার primary।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Outlined TextField',
              hintText: 'Type here... / এখানে লেখো...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Filled TextField',
              hintText: 'Type here... / এখানে লেখো...',
              filled: true,
              border: UnderlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Error TextField / এরর',
              errorText: 'This field is required / এটি আবশ্যক',
              border: const OutlineInputBorder(),
              prefixIcon: Icon(Icons.warning, color: cs.error),
            ),
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 🔄 TOGGLES
          // ═══════════════════════════════════════════════════════════════
          Text('🔄 Toggles / টগল', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'ON state uses primary. OFF state uses outline.\n'
            'ON অবস্থা primary ব্যবহার করে। OFF অবস্থা outline।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Switch / সুইচ'),
            subtitle: Text(
              _switchValue
                  ? 'ON — primary color / primary কালার'
                  : 'OFF — outline color / outline কালার',
            ),
            value: _switchValue,
            onChanged: (v) => setState(() => _switchValue = v),
          ),
          CheckboxListTile(
            title: const Text('Checkbox / চেকবক্স'),
            subtitle: Text(
              _checkboxValue
                  ? 'Checked — primary fill / primary ফিল'
                  : 'Unchecked — outline border / outline বর্ডার',
            ),
            value: _checkboxValue,
            onChanged: (v) => setState(() => _checkboxValue = v!),
          ),
          const Divider(height: 16),

          // Slider
          Text('Slider / স্লাইডার:', style: textTheme.titleSmall),
          Slider(
            value: _sliderValue,
            onChanged: (v) => setState(() => _sliderValue = v),
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 📋 LIST TILES
          // ═══════════════════════════════════════════════════════════════
          Text('📋 List Tiles / লিস্ট টাইল', style: textTheme.titleLarge),
          const SizedBox(height: 12),
          Card.outlined(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cs.primaryContainer,
                    child: Icon(Icons.person, color: cs.onPrimaryContainer),
                  ),
                  title: const Text('Ratul Ahmed / রাতুল আহমেদ'),
                  subtitle: const Text('Flutter Developer / ফ্লাটার ডেভেলপার'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cs.secondaryContainer,
                    child: Icon(Icons.code, color: cs.onSecondaryContainer),
                  ),
                  title: const Text('Theme Expert / থিম এক্সপার্ট'),
                  subtitle: const Text('Material 3 / ম্যাটেরিয়াল ৩'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cs.tertiaryContainer,
                    child: Icon(Icons.palette, color: cs.onTertiaryContainer),
                  ),
                  title: const Text('Color Artist / কালার আর্টিস্ট'),
                  subtitle: const Text('Design System / ডিজাইন সিস্টেম'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 🔔 SNACKBAR & DIALOG
          // ═══════════════════════════════════════════════════════════════
          Text(
            '🔔 Snackbar & Dialog / স্ন্যাকবার ও ডায়ালগ',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'SnackBar uses inverseSurface! / SnackBar inverseSurface ব্যবহার করে!',
                      ),
                      action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
                label: const Text('SnackBar'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Dialog / ডায়ালগ'),
                      content: const Text(
                        'Dialog bg uses surfaceContainerHigh!\n'
                        'ডায়ালগ surfaceContainerHigh ব্যবহার করে!',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel / বাতিল'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('OK / ঠিক আছে'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Dialog'),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Bottom Sheet / বটম শীট',
                            style: Theme.of(ctx).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Uses surfaceContainerLow!\n'
                            'surfaceContainerLow ব্যবহার করে!',
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.vertical_align_bottom),
                label: const Text('Bottom Sheet'),
              ),
            ],
          ),
          const Divider(height: 32),

          // ═══════════════════════════════════════════════════════════════
          // 📊 PROGRESS INDICATORS
          // ═══════════════════════════════════════════════════════════════
          Text('📊 Progress / প্রগ্রেস', style: textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Uses primary color for the active indicator.\n'
            'অ্যাক্টিভ ইন্ডিকেটরে primary কালার ব্যবহার করে।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          const LinearProgressIndicator(value: 0.7),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(),
              CircularProgressIndicator(value: 0.7),
            ],
          ),
          const SizedBox(height: 16),

          // Badges
          Text('🏷️ Badges / ব্যাজ', style: textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(
            'Badges use error color to grab attention.\n'
            'ব্যাজ error কালার ব্যবহার করে মনোযোগ আকর্ষণে।',
            style: textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Badge(
                label: const Text('3'),
                child: Icon(Icons.mail, size: 32, color: cs.onSurfaceVariant),
              ),
              Badge(
                label: const Text('99+'),
                child: Icon(
                  Icons.notifications,
                  size: 32,
                  color: cs.onSurfaceVariant,
                ),
              ),
              Badge(
                child: Icon(Icons.chat, size: 32, color: cs.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 48),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════════
      // 🔵 FAB — primaryContainer bg + onPrimaryContainer icon
      // ═══════════════════════════════════════════════════════════════════
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
