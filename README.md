# 🎨 Flutter Theme Masterclass — Complete Guide
## ফ্লাটার থিম মাস্টারক্লাস — সম্পূর্ণ গাইড

> **English + বাংলা** | From Zero to Hero | Material 3

---

## 📖 Table of Contents / সূচিপত্র

1. [What is Theme? / থিম কী?](#1-what-is-theme)
2. [ThemeData — The Boss / ThemeData — বস](#2-themedata)
3. [ColorScheme — The Color Brain / ColorScheme — কালার ব্রেইন](#3-colorscheme)
4. [ColorScheme.fromSeed — Magic Color / বীজ থেকে সব কালার](#4-colorschemefromseed)
5. [Every Color Role Explained / প্রতিটি কালার রোল](#5-color-roles)
6. [Light Mode vs Dark Mode / লাইট মোড বনাম ডার্ক মোড](#6-light-vs-dark)
7. [Typography & TextTheme / টাইপোগ্রাফি](#7-typography)
8. [Component Themes / কম্পোনেন্ট থিম](#8-component-themes)
9. [Material 3 Design System / ম্যাটেরিয়াল ৩](#9-material-3)
10. [Best Practices / সেরা অভ্যাস](#10-best-practices)
11. [Visual Cheat Sheet / ভিজ্যুয়াল চিট শীট](#11-cheat-sheet)

---

## 1. What is Theme? / থিম কী? <a name="1-what-is-theme"></a>

**English:** Hey! Think of Theme like the "dress code" of your app. Just like a school has a uniform — every button, text, background follows the same style. Without a theme, your app looks like everyone wore random clothes! 😄

**বাংলা:** হেই! থিম হলো তোমার অ্যাপের "ড্রেস কোড"। স্কুলে যেমন ইউনিফর্ম থাকে — প্রতিটি বাটন, টেক্সট, ব্যাকগ্রাউন্ড একই স্টাইল ফলো করে। থিম ছাড়া অ্যাপ দেখতে এমন লাগে যেন সবাই এলোমেলো কাপড় পরেছে! 😄

```dart
// Without theme — Every widget has its own color (MESSY!)
// থিম ছাড়া — প্রতিটি widget নিজের রং নিজে সেট করে (এলোমেলো!)
Container(color: Colors.blue)       // ❌ Hardcoded
Text('Hello', style: TextStyle(color: Colors.red))  // ❌ Hardcoded

// With theme — All widgets follow ONE source of truth
// থিম দিয়ে — সব widget একটা source থেকে রং নেয়
Container(color: Theme.of(context).colorScheme.primary)     // ✅
Text('Hello', style: Theme.of(context).textTheme.bodyLarge) // ✅
```

---

## 2. ThemeData — The Boss <a name="2-themedata"></a>

**English:** `ThemeData` is like the PRINCIPAL of the school. It decides everything — colors, fonts, button styles, card shapes. You set it ONCE in `MaterialApp`, and every widget in your app follows it.

**বাংলা:** `ThemeData` হলো স্কুলের প্রিন্সিপ্যালের মতো। সে সব কিছু ঠিক করে — কালার, ফন্ট, বাটন স্টাইল, কার্ড শেপ। তুমি একবার `MaterialApp`-এ সেট করবে, আর সব widget সেটা follow করবে।

```dart
MaterialApp(
  // 🎯 This is where the MAGIC starts!
  // 🎯 এখান থেকেই জাদু শুরু!
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,  // Material 3 ON!
  ),
  home: MyHomePage(),
)
```

### What ThemeData contains / ThemeData-তে কী কী আছে:

| Property | What it does | কী করে |
|---|---|---|
| `colorScheme` | All colors | সব কালার |
| `textTheme` | All text styles | সব টেক্সট স্টাইল |
| `elevatedButtonTheme` | Button style | বাটন স্টাইল |
| `cardTheme` | Card style | কার্ড স্টাইল |
| `appBarTheme` | AppBar style | অ্যাপবার স্টাইল |
| `scaffoldBackgroundColor` | Background | ব্যাকগ্রাউন্ড |
| `brightness` | Light/Dark | লাইট/ডার্ক |

---

## 3. ColorScheme — The Color Brain <a name="3-colorscheme"></a>

**English:** Hey! `ColorScheme` is the BRAIN of all colors. Instead of using random `Colors.blue`, `Colors.red` everywhere, ColorScheme gives you NAMED roles. It's like — "Hey primary, you're the main color. Hey surface, you're the background."

**বাংলা:** হেই! `ColorScheme` হলো সব কালারের ব্রেইন। এলোমেলো `Colors.blue`, `Colors.red` ব্যবহার না করে, ColorScheme তোমাকে নামওয়ালা ভূমিকা দেয়। এটা এমন — "হেই primary, তুমি মেইন কালার। হেই surface, তুমি ব্যাকগ্রাউন্ড।"

### The ColorScheme Family Tree:

```
ColorScheme
├── primary          → Main brand color (মেইন ব্র্যান্ড কালার)
├── onPrimary        → Text/icon ON primary (primary-র ওপরে টেক্সট)
├── primaryContainer → Lighter version of primary (primary-র হালকা ভার্সন)
├── onPrimaryContainer → Text ON primaryContainer
│
├── secondary        → Accent color (অ্যাকসেন্ট কালার)
├── onSecondary      → Text ON secondary
├── secondaryContainer → Lighter secondary
├── onSecondaryContainer → Text ON secondaryContainer
│
├── tertiary         → Third color for contrast (তৃতীয় কালার)
├── onTertiary       → Text ON tertiary
├── tertiaryContainer → Lighter tertiary
├── onTertiaryContainer → Text ON tertiaryContainer
│
├── error            → Error/danger color (এরর কালার — লাল)
├── onError          → Text ON error
├── errorContainer   → Lighter error
├── onErrorContainer → Text ON errorContainer
│
├── surface          → Background color (ব্যাকগ্রাউন্ড) ⭐
├── onSurface        → Text ON surface (সারফেস-এর ওপরে টেক্সট) ⭐
├── surfaceContainerLowest → Lightest surface variant
├── surfaceContainerLow    → Light surface variant
├── surfaceContainer       → Default surface variant
├── surfaceContainerHigh   → Darker surface variant
├── surfaceContainerHighest→ Darkest surface variant
│
├── outline          → Border color (বর্ডার কালার)
├── outlineVariant   → Subtle border (হালকা বর্ডার)
│
├── inverseSurface   → Opposite surface (উল্টো সারফেস)
├── onInverseSurface → Text ON inverseSurface
├── inversePrimary   → Primary for inverse (উল্টো primary)
│
├── shadow           → Shadow color (ছায়ার কালার)
└── scrim            → Overlay/scrim color (ওভারলে কালার)
```

---

## 4. ColorScheme.fromSeed — Magic! <a name="4-colorschemefromseed"></a>

**English:** This is the COOLEST feature! You give Flutter ONE color (the seed), and it generates ALL 30+ colors automatically! It uses the Material 3 color algorithm (HCT - Hue, Chroma, Tone).

**বাংলা:** এটা সবচেয়ে দারুণ ফিচার! তুমি Flutter-কে একটা কালার দাও (seed/বীজ), আর সে নিজে থেকে ৩০+ কালার বানিয়ে ফেলে! এটা Material 3 কালার অ্যালগরিদম ব্যবহার করে।

```dart
// Give ONE seed color, get EVERYTHING!
// একটা seed কালার দাও, সব পেয়ে যাও!
ColorScheme.fromSeed(seedColor: Colors.deepPurple)
```

### What happens when seed = deepPurple:
```
Seed: deepPurple (গাঢ় বেগুনি)
│
├── primary:          Deep purple shade (গাঢ় বেগুনি শেড)
├── primaryContainer: Light purple (হালকা বেগুনি)
├── secondary:        Complementary tone (পরিপূরক টোন)
├── tertiary:         Contrasting hue (বিপরীত হিউ)
├── surface:          Almost white/light gray (প্রায় সাদা)
├── error:            Red (still red!) (লাল — সবসময়ই লাল!)
└── ... all 30+ colors generated!
```

### Try different seeds / বিভিন্ন seed চেষ্টা করো:
```dart
// 🔵 Blue seed → Cool, professional feel
ColorScheme.fromSeed(seedColor: Colors.blue)

// 🟢 Green seed → Fresh, natural feel  
ColorScheme.fromSeed(seedColor: Colors.green)

// 🟠 Orange seed → Warm, energetic feel
ColorScheme.fromSeed(seedColor: Colors.orange)

// 🔴 Red seed → Bold, passionate feel
ColorScheme.fromSeed(seedColor: Colors.red)

// 🟣 Custom color → Any hex color works!
ColorScheme.fromSeed(seedColor: Color(0xFF6750A4))
```

---

## 5. Every Color Role Explained with Visual Effect <a name="5-color-roles"></a>

### 🎯 PRIMARY — The Star / তারকা

**English:** Hey! `primary` is your app's STAR color — the most important, most visible. It's used in FAB buttons, AppBar (sometimes), important buttons, active states.

**বাংলা:** হেই! `primary` হলো তোমার অ্যাপের তারকা কালার — সবচেয়ে গুরুত্বপূর্ণ, সবচেয়ে বেশি দেখা যায়। FAB বাটন, AppBar, গুরুত্বপূর্ণ বাটন, অ্যাক্টিভ স্টেট-এ ব্যবহার হয়।

```
┌─────────────────────────────┐
│  ████████████████████████   │  ← primary (e.g., Deep Purple)
│  This is a FilledButton     │
│  Text color = onPrimary     │  ← onPrimary (White text)
│  ████████████████████████   │
└─────────────────────────────┘

If primary = deepPurple → Button is PURPLE, text is WHITE
যদি primary = deepPurple → বাটন বেগুনি হবে, টেক্সট সাদা হবে
```

### 🎨 PRIMARY CONTAINER — The Soft Version / নরম ভার্সন

```
┌─────────────────────────────┐
│  ░░░░░░░░░░░░░░░░░░░░░░░   │  ← primaryContainer (Light Purple)
│  This is a Chip / Tag       │
│  Text = onPrimaryContainer  │  ← onPrimaryContainer (Dark Purple text)
│  ░░░░░░░░░░░░░░░░░░░░░░░   │
└─────────────────────────────┘

Think of it as the "pastel" version of primary!
এটাকে primary-র "প্যাস্টেল" ভার্সন মনে করো!
```

### 🌟 SECONDARY — The Supporting Actor / সামনের সহকারী

```
Used for: Filter chips, Less important buttons, Toggle buttons
ব্যবহার: ফিল্টার চিপ, কম গুরুত্বপূর্ণ বাটন, টগল বাটন

┌──────────┐  ┌──────────┐  ┌──────────┐
│ Filter 1 │  │ Filter 2 │  │ Filter 3 │  ← secondaryContainer bg
│ (active) │  │          │  │          │     onSecondaryContainer text
└──────────┘  └──────────┘  └──────────┘
```

### 🎭 TERTIARY — The Spice / মসলা

```
Tertiary adds CONTRAST and visual interest. 
It's the third color that makes designs POP!

tertiary ব্যবহার হয় contrast এবং visual interest যোগ করতে।
এটা তৃতীয় কালার যেটা ডিজাইনকে আকর্ষণীয় করে!

Example: If primary=purple, secondary=pinkish, tertiary might be=orange-ish
```

### 🔴 ERROR — Danger Zone! / বিপদ জোন!

```
┌─────────────────────────────┐
│  ⚠️ Invalid email address   │  ← errorContainer (Light Red bg)
│  Text = onErrorContainer    │  ← onErrorContainer (Dark Red text)
└─────────────────────────────┘

┌─────────────────────────────┐
│  🗑️ DELETE ACCOUNT          │  ← error (Red bg)
│  Text = onError             │  ← onError (White text)
└─────────────────────────────┘

Error is ALWAYS some shade of red. Even fromSeed keeps it red!
Error সবসময় লাল-ই থাকে। fromSeed ব্যবহার করলেও লালই থাকে!
```

### 📄 SURFACE — The Stage / মঞ্চ

**English:** Hey! `surface` is like the STAGE where everything sits. It's your Scaffold background, Card background, Dialog background. In light mode it's whitish, in dark mode it's dark gray.

**বাংলা:** হেই! `surface` হলো মঞ্চের মতো যেখানে সব কিছু বসে। এটা তোমার Scaffold ব্যাকগ্রাউন্ড, Card ব্যাকগ্রাউন্ড, Dialog ব্যাকগ্রাউন্ড। লাইট মোডে সাদাটে, ডার্ক মোডে গাঢ় ধূসর।

```
LIGHT MODE:                          DARK MODE:
┌─────────────────────┐              ┌─────────────────────┐
│ surface (≈ white)   │              │ surface (≈ #1C1B1F) │
│ ┌─────────────────┐ │              │ ┌─────────────────┐ │
│ │ Card             │ │              │ │ Card             │ │
│ │ surfaceContainer │ │              │ │ surfaceContainer │ │
│ │ (slightly gray)  │ │              │ │ (slightly light) │ │
│ └─────────────────┘ │              │ └─────────────────┘ │
│                     │              │                     │
│ Text = onSurface    │              │ Text = onSurface    │
│ (≈ black)           │              │ (≈ white)           │
└─────────────────────┘              └─────────────────────┘
```

### Surface Container Levels (elevation alternatives):

```
Material 3 replaced elevation-based surfaces with explicit container levels:

surfaceContainerLowest  ░░░░░  (সবচেয়ে হালকা - lightest)
surfaceContainerLow     ░░░░░  
surfaceContainer        ▒▒▒▒▒  (ডিফল্ট - default)
surfaceContainerHigh    ▓▓▓▓▓  
surfaceContainerHighest █████  (সবচেয়ে গাঢ় - darkest)

Use higher levels for elements that should appear "above" others.
উচ্চতর লেভেল ব্যবহার করো এমন elements-এর জন্য যেগুলো "উপরে" দেখাতে চাও।

Example: NavigationBar uses surfaceContainerHigh
         Cards might use surfaceContainerLow
```

### 📏 OUTLINE — The Borders / বর্ডার

```
┌─────────────────────────────┐
│                             │  ← outline (visible border)
│  TextField with border      │     দৃশ্যমান বর্ডার
│                             │
└─────────────────────────────┘

┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
                                  ← outlineVariant (subtle divider)
└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘     হালকা ডিভাইডার
```

---

## 6. Light Mode vs Dark Mode <a name="6-light-vs-dark"></a>

**English:** Hey! The BEAUTIFUL thing about `ColorScheme.fromSeed` — it generates BOTH light and dark schemes from the SAME seed! Just add `brightness: Brightness.dark`.

**বাংলা:** হেই! `ColorScheme.fromSeed`-এর সবচেয়ে সুন্দর জিনিস — এটা একই seed থেকে লাইট এবং ডার্ক দুটোই বানায়! শুধু `brightness: Brightness.dark` যোগ করো।

```dart
MaterialApp(
  // 🌞 Light Theme / লাইট থিম
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,  // ← Default! ডিফল্ট!
    ),
    useMaterial3: true,
  ),

  // 🌙 Dark Theme / ডার্ক থিম  
  darkTheme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,   // ← SAME seed! একই seed!
      brightness: Brightness.dark,    // ← Just change this! শুধু এটা পাল্টাও!
    ),
    useMaterial3: true,
  ),

  // 🔄 Which one to use? / কোনটা ব্যবহার করবে?
  themeMode: ThemeMode.system, // Follow phone setting (ফোনের সেটিং follow করো)
  // themeMode: ThemeMode.light,  // Always light (সবসময় লাইট)
  // themeMode: ThemeMode.dark,   // Always dark (সবসময় ডার্ক)
)
```

### Visual Comparison / ভিজ্যুয়াল তুলনা:

```
🌞 LIGHT MODE (seed: deepPurple)     🌙 DARK MODE (seed: deepPurple)
─────────────────────────────         ─────────────────────────────
primary:     #6750A4 (purple)         primary:     #D0BCFF (light purple)
onPrimary:   #FFFFFF (white)          onPrimary:   #381E72 (dark purple)
surface:     #FEF7FF (near white)     surface:     #141218 (near black)
onSurface:   #1D1B20 (near black)     onSurface:   #E6E0E9 (near white)
─────────────────────────────         ─────────────────────────────

Notice: In dark mode, primary becomes LIGHTER (so it's visible on dark bg)
         ডার্ক মোডে primary হালকা হয়ে যায় (যাতে ডার্ক bg-তে দেখা যায়)

Notice: surface and onSurface FLIP!
         surface আর onSurface উল্টে যায়!
```

---

## 7. Typography & TextTheme <a name="7-typography"></a>

**English:** Material 3 has a clear text scale. Each has a "name" and a "size". Think of it like T-shirt sizes!

**বাংলা:** Material 3-তে পরিষ্কার টেক্সট স্কেল আছে। প্রতিটির একটা "নাম" এবং "সাইজ" আছে। টি-শার্ট সাইজের মতো ভাবো!

```
Display Large    57px   ── "HERO text" (like movie poster)
Display Medium   45px   ── "Big headline"  
Display Small    36px   ── "Section title"

Headline Large   32px   ── "Page title"
Headline Medium  28px   ── "Card title"
Headline Small   24px   ── "Dialog title"

Title Large      22px   ── "AppBar title"
Title Medium     16px   ── "Tab label, bold"
Title Small      14px   ── "Sub-header"

Body Large       16px   ── "Main text" ⭐ (most used!)
Body Medium      14px   ── "Regular text" ⭐
Body Small       12px   ── "Caption text"

Label Large      14px   ── "Button text" ⭐
Label Medium     12px   ── "Navigation label"
Label Small      11px   ── "Chip text"
```

```dart
// How to use / কীভাবে ব্যবহার করবে:
Text(
  'Hello!',
  style: Theme.of(context).textTheme.headlineMedium,
  // This gives you: size 28, proper weight, proper spacing
  // এটা দেবে: সাইজ ২৮, সঠিক ওজন, সঠিক স্পেসিং
)

// With color from scheme / স্কিম থেকে কালার দিয়ে:
Text(
  'Colored text',
  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: Theme.of(context).colorScheme.primary,
  ),
)
```

---

## 8. Component Themes <a name="8-component-themes"></a>

**English:** Every Material widget can be themed globally! Set it once, every instance follows.

**বাংলা:** প্রতিটি Material widget কে globally থিম করা যায়! একবার সেট করো, প্রতিটি ইনস্ট্যান্স follow করবে।

```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  
  // 🔘 Button Theme / বাটন থিম
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  
  // 📱 AppBar Theme / অ্যাপবার থিম
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    // M3 default: surface color with surfaceTint
  ),
  
  // 🃏 Card Theme / কার্ড থিম
  cardTheme: CardThemeData(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  
  // 📝 Input (TextField) Theme / ইনপুট থিম
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
  
  // 🔽 Navigation Bar Theme / নেভিগেশন বার থিম
  navigationBarTheme: NavigationBarThemeData(
    height: 65,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
)
```

---

## 9. Material 3 Design System <a name="9-material-3"></a>

**English:** Material 3 (M3) is Google's LATEST design language. Flutter uses it by default now! Key differences from M2:

**বাংলা:** Material 3 (M3) হলো Google-এর সর্বশেষ ডিজাইন ল্যাঙ্গুয়েজ। Flutter এখন ডিফল্টভাবে এটা ব্যবহার করে! M2 থেকে প্রধান পার্থক্য:

```
M2 (OLD / পুরনো)                    M3 (NEW / নতুন) ✅
──────────────────                   ──────────────────
primarySwatch                   →    ColorScheme.fromSeed
elevation = shadow               →    elevation = surfaceTint + shadow
Sharp corners                    →    Rounded corners (গোলাকার কোণা)
ThemeData(primarySwatch: ...)    →    ThemeData(colorScheme: ...) 
accentColor (deprecated!)        →    secondary / tertiary
background (deprecated!)         →    surface
surfaceVariant (deprecated!)     →    surfaceContainerHighest
```

### M3 Button Types / M3 বাটনের ধরন:

```
┌──────────────────┐     Filled Button (primary bg)
│   FILLED BUTTON  │     সবচেয়ে গুরুত্বপূর্ণ অ্যাকশন
│   primary bg     │     → FilledButton / ElevatedButton
└──────────────────┘     

┌──────────────────┐     Filled Tonal (secondaryContainer bg)
│  TONAL BUTTON    │     মাঝারি গুরুত্বের অ্যাকশন
│  secondaryCont.  │     → FilledButton.tonal
└──────────────────┘     

┌──────────────────┐     Outlined Button (outlined)
│  OUTLINED BUTTON │     কম গুরুত্বের অ্যাকশন
│  outline border  │     → OutlinedButton
└──────────────────┘     

   TEXT BUTTON           Text Button (no bg)
   primary text          সবচেয়ে কম গুরুত্বের
                         → TextButton
```

---

## 10. Best Practices / সেরা অভ্যাস <a name="10-best-practices"></a>

### ✅ DO / করো:
```dart
// 1. ALWAYS use ColorScheme, not hardcoded colors!
// সবসময় ColorScheme ব্যবহার করো, হার্ডকোডেড কালার না!
color: Theme.of(context).colorScheme.primary  // ✅

// 2. ALWAYS use TextTheme for text styles!
// সবসময় TextTheme ব্যবহার করো টেক্সট স্টাইলের জন্য!
style: Theme.of(context).textTheme.bodyLarge  // ✅

// 3. Use fromSeed for automatic color generation!
// fromSeed ব্যবহার করো অটোমেটিক কালার জেনারেশনের জন্য!
ColorScheme.fromSeed(seedColor: Colors.blue)  // ✅

// 4. Support BOTH light and dark mode!
// লাইট এবং ডার্ক দুই মোডই সাপোর্ট করো!
theme: lightTheme, darkTheme: darkTheme  // ✅

// 5. Use "on" colors for text ON colored surfaces!
// রঙিন সারফেসের ওপরে টেক্সটের জন্য "on" কালার ব্যবহার করো!
Container(
  color: colorScheme.primary,
  child: Text('Hi', style: TextStyle(color: colorScheme.onPrimary)),  // ✅
)
```

### ❌ DON'T / কোরো না:
```dart
// 1. Don't hardcode colors! / কালার হার্ডকোড কোরো না!
color: Colors.purple  // ❌ Won't change with theme!

// 2. Don't hardcode text sizes! / টেক্সট সাইজ হার্ডকোড কোরো না!
TextStyle(fontSize: 24, fontWeight: FontWeight.bold)  // ❌

// 3. Don't use deprecated properties! / deprecated প্রোপার্টি ব্যবহার কোরো না!
ThemeData(primarySwatch: Colors.blue)  // ❌ OLD!
ThemeData(accentColor: Colors.pink)    // ❌ DEPRECATED!

// 4. Don't mix onX colors wrong! / onX কালার ভুলভাবে মিক্স কোরো না!
Container(
  color: colorScheme.primary,
  child: Text('Hi', style: TextStyle(color: colorScheme.onSurface)),  // ❌ WRONG!
  // onSurface is for surface bg, not primary bg!
  // onSurface হলো surface bg-র জন্য, primary bg-র জন্য না!
)
```

### 🏗️ Architecture Pattern / আর্কিটেকচার প্যাটার্ন:

```dart
// Create a separate theme file! / আলাদা থিম ফাইল বানাও!
// lib/theme/app_theme.dart

class AppTheme {
  static const seedColor = Colors.deepPurple;
  
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
  
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}

// Then in main.dart:
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
)
```

---

## 11. Visual Cheat Sheet <a name="11-cheat-sheet"></a>

### "If I change X, what happens?" / "X পাল্টালে কী হবে?"

```
🔄 CHANGE seedColor:
   → ALL colors change! Primary, secondary, tertiary, containers, everything!
   → সব কালার পাল্টে যায়! Primary, secondary, tertiary, container, সব!

🔄 CHANGE brightness to dark:
   → Surface becomes dark (near black)
   → onSurface becomes light (near white)  
   → Primary becomes LIGHTER (visible on dark)
   → সারফেস ডার্ক হয়, টেক্সট লাইট হয়, primary হালকা হয়

🔄 CHANGE primary manually:
   → FilledButton color changes
   → FAB color changes
   → Active states change
   → Links/emphasis text changes
   → ফিল্ড বাটন, FAB, অ্যাক্টিভ স্টেট পাল্টায়

🔄 CHANGE surface manually:
   → Scaffold background changes
   → Card background changes  
   → Dialog background changes
   → স্ক্যাফোল্ড, কার্ড, ডায়ালগ ব্যাকগ্রাউন্ড পাল্টায়

🔄 CHANGE textTheme:
   → ALL text in the app changes font/size/weight
   → অ্যাপের সব টেক্সটের ফন্ট/সাইজ/ওজন পাল্টায়
```

### Quick Reference Table / দ্রুত রেফারেন্স:

```
Widget              Uses This Color         বাংলা
──────────────────  ─────────────────────── ──────
Scaffold bg         surface                 ব্যাকগ্রাউন্ড
AppBar bg           surface (M3)            অ্যাপবার
Card bg             surfaceContainerLow     কার্ড
Dialog bg           surfaceContainerHigh    ডায়ালগ
NavigationBar       surfaceContainerHigh    নেভিগেশন বার
NavigationRail      surface                 নেভিগেশন রেইল
FilledButton        primary                 ফিল্ড বাটন
FAB                 primaryContainer        ফ্লোটিং বাটন
OutlinedButton      outline border          আউটলাইন বাটন
TextButton          primary (text)          টেক্সট বাটন
TextField           onSurfaceVariant        ইনপুট ফিল্ড
Chip (selected)     secondaryContainer      চিপ
Switch (on)         primary                 সুইচ
Checkbox (on)       primary                 চেকবক্স
SnackBar            inverseSurface          স্ন্যাকবার
Divider             outlineVariant          ডিভাইডার
Error text          error                   এরর টেক্সট
```

---

## 🚀 Run the Demo App! / ডেমো অ্যাপ চালাও!

The demo app in `lib/main.dart` shows ALL these concepts visually!
Run it with: `flutter run`

Switch between tabs to see:
1. **Color Scheme** — All 30+ colors with names
2. **Typography** — All text styles  
3. **Components** — Buttons, Cards, Chips, etc.
4. **Light/Dark** — Toggle between modes
5. **Seed Explorer** — Change seed color and see ALL colors change live!

---

*Made with ❤️ for Flutter learners*
