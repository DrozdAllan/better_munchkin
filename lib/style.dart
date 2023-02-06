import 'package:better_munchkin/utils/commons.dart';

// if you want google fonts
import 'package:google_fonts/google_fonts.dart';

const _bodyTextSize = 24.0;
const _largeTextSize = 36.0;
const _pageTitleSize = 48.0;

// if you want custom fonts, store them in assets/fonts + note them in pubspec.yaml
const portLligatSans = 'PortLligatSans';

const Color _primaryColor = Color(0xFFc0cfff);
const Color _secondaryColor = Colors.greenAccent;

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  primaryTextTheme: const TextTheme(),
  // TODO: change text color on card
//   cardTheme: const CardTheme(),
  dividerTheme: const DividerThemeData(color: _primaryColor),
//   chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
//   textButtonTheme: const TextButtonThemeData(),
  fontFamily: GoogleFonts.saira().fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    titleLarge: TextStyle(),
    bodyMedium: TextStyle(fontSize: _bodyTextSize),
  ),
);

ThemeData myDarkTheme = ThemeData.dark(
  useMaterial3: true,
);
