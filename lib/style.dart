import 'package:better_munchkin/utils/commons.dart';
import 'package:google_fonts/google_fonts.dart';

const _appBarTitleSize = 28.0;
const _bodyMediumSize = 24.0;

const Color _primaryColor = Color(0xFFc0cfff);
const Color _primaryDarkColor = Color(0xFF343952);
const Color _primaryLightColor = Color(0xFFE8EDFF);

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  fontFamily: GoogleFonts.saira().fontFamily,
  iconTheme: const IconThemeData(color: _primaryDarkColor),
  dialogTheme: const DialogTheme(surfaceTintColor: _primaryLightColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(_primaryDarkColor),
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle:
        TextStyle(fontSize: _appBarTitleSize, color: _primaryDarkColor),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryLightColor, height: 50.0, padding: EdgeInsets.all(0.0)),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: _primaryDarkColor,
    contentTextStyle: TextStyle(fontSize: 14.0),
  ),
  textTheme: const TextTheme(
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(color: _primaryDarkColor),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _bodyMediumSize, color: _primaryDarkColor),
  ),
);

ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: _primaryColor,
  ),
  fontFamily: GoogleFonts.saira().fontFamily,
  iconTheme: const IconThemeData(color: _primaryLightColor),
  dialogTheme: const DialogTheme(surfaceTintColor: _primaryDarkColor),
  chipTheme: const ChipThemeData(backgroundColor: _primaryDarkColor),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(_primaryLightColor))),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle:
        TextStyle(fontSize: _appBarTitleSize, color: _primaryLightColor),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryDarkColor, height: 50.0, padding: EdgeInsets.all(0.0)),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: _primaryDarkColor,
    contentTextStyle: TextStyle(fontSize: 14.0),
  ),
  textTheme: const TextTheme(
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(color: _primaryLightColor),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _bodyMediumSize, color: _primaryLightColor),
  ),
);
