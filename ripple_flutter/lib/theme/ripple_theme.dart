import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Ripple design tokens.
///
/// Primary lime, olive ink/accent, neutral secondary scale.
/// Display type Oswald, body type Roboto (via google_fonts).
abstract final class RippleColors {
  static const lime = Color(0xFFD3FB52);
  static const limeDark = Color(0xFFA8C93E);
  static const olive = Color(0xFF052326);
  static const oliveSoft = Color(0xFF0E3A3E);

  static const paper = Color(0xFFF7F7F1);
  static const mist = Color(0xFFE9EBE0);
  static const stone = Color(0xFF6B7268);
  static const smoke = Color(0xFF3A4039);
  static const milk = Color(0xFFEDEFE4);
}

/// Light and dark themes for the host app.
///
/// Generated personal apps render through UiRenderer with their own
/// inline styles; this theme governs the host chrome (gallery,
/// builder, auth, sharing).
abstract final class RippleTheme {
  static ThemeData get light {
    final scheme = const ColorScheme.light(
      primary: RippleColors.lime,
      onPrimary: RippleColors.olive,
      primaryContainer: RippleColors.limeDark,
      secondary: RippleColors.stone,
      surface: Colors.white,
      onSurface: RippleColors.olive,
      surfaceContainerHighest: RippleColors.paper,
      outline: RippleColors.mist,
    );
    return _build(scheme, Brightness.light);
  }

  static ThemeData get dark {
    final scheme = const ColorScheme.dark(
      primary: RippleColors.lime,
      onPrimary: RippleColors.olive,
      primaryContainer: RippleColors.limeDark,
      secondary: RippleColors.mist,
      surface: RippleColors.olive,
      onSurface: RippleColors.milk,
      surfaceContainerHighest: RippleColors.oliveSoft,
      outline: RippleColors.smoke,
    );
    return _build(scheme, Brightness.dark);
  }

  static ThemeData _build(ColorScheme scheme, Brightness brightness) {
    final base = ThemeData(
      colorScheme: scheme,
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: RippleColors.lime,
          foregroundColor: RippleColors.olive,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.oswald(
          textStyle: base.textTheme.displayLarge,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: GoogleFonts.oswald(
          textStyle: base.textTheme.displayMedium,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: GoogleFonts.oswald(
          textStyle: base.textTheme.headlineLarge,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.oswald(
          textStyle: base.textTheme.headlineMedium,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.oswald(
          textStyle: base.textTheme.titleLarge,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
