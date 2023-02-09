import 'package:better_munchkin/utils/commons.dart';

// if you want google fonts
import 'package:google_fonts/google_fonts.dart';

const _titleLargeSize = 32.0;
const _titleMediumSize = 28.0;

// if you want custom fonts, store them in assets/fonts + note them in pubspec.yaml
const portLligatSans = 'PortLligatSans';

const Color _primaryColor = Color(0xFFc0cfff);
const Color _blackColor = Color(0xFF212430);
const Color _whiteColor = Color(0xFFE8EDFF);

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  iconTheme: const IconThemeData(color: _blackColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30.0, color: _blackColor),
  ),
  fontFamily: GoogleFonts.saira().fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    // Title of Home and Strategic
    titleLarge: TextStyle(fontSize: _titleLargeSize),
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(fontSize: _titleMediumSize, color: _blackColor),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _titleMediumSize),
  ),
//   buttonTheme: ,
);

ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: _primaryColor),
  iconTheme: const IconThemeData(color: _whiteColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30.0, color: _whiteColor),
  ),
  fontFamily: GoogleFonts.saira().fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    // Title of Home and Strategic
    titleLarge: TextStyle(fontSize: _titleLargeSize),
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(fontSize: _titleMediumSize, color: _whiteColor),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _titleMediumSize),
  ),
);
