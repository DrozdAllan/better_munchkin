import 'package:better_munchkin/utils/commons.dart';

// if you want google fonts
import 'package:google_fonts/google_fonts.dart';

const _titleLargeSize = 32.0;
const _titleMediumSize = 28.0;

// if you want custom fonts, store them in assets/fonts + note them in pubspec.yaml
const portLligatSans = 'PortLligatSans';

const Color _primaryColor = Color(0xFFc0cfff);
const Color _blackColor = Color(0xFF343952);
const Color _whiteColor = Color(0xFFE8EDFF);

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  fontFamily: GoogleFonts.saira().fontFamily,
  iconTheme: const IconThemeData(color: _blackColor),
  dialogTheme: const DialogTheme(surfaceTintColor: _whiteColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
  iconButtonTheme: const IconButtonThemeData(
      style:
          ButtonStyle(foregroundColor: MaterialStatePropertyAll(_blackColor))),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30.0, color: _blackColor),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      height: 50.0,
      padding: EdgeInsets.all(0.0)),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: _blackColor,
    contentTextStyle: TextStyle(fontSize: 14.0),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    // Title of Home and Strategic
    titleLarge: TextStyle(fontSize: _titleLargeSize),
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(fontSize: _titleMediumSize, color: _blackColor),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _titleMediumSize, color: _blackColor),
  ),
);

ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: _primaryColor),
  fontFamily: GoogleFonts.saira().fontFamily,
  iconTheme: const IconThemeData(color: _whiteColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30.0, color: _whiteColor),
  ),
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
