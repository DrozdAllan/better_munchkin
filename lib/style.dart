import 'package:better_munchkin/utils/commons.dart';
import 'package:flutter/services.dart';

// if you want google fonts
import 'package:google_fonts/google_fonts.dart';

const _titleLargeSize = 32.0;
const _titleMediumSize = 28.0;
const _bodyMediumSize = 24.0;

// if you want custom fonts, store them in assets/fonts + note them in pubspec.yaml
const portLligatSans = 'PortLligatSans';

const Color _primaryColor = Color(0xFFc0cfff);
const Color _blackColor = Color(0xFF4A506A);
const Color _secondaryColor = Colors.greenAccent;

ThemeData myLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  // TODO: change text color on card for a colored black
  dividerTheme: const DividerThemeData(color: _primaryColor),
//   chipTheme: const ChipThemeData(backgroundColor: _primaryColor),
//   textButtonTheme: const TextButtonThemeData(),
  appBarTheme: const AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 38.0, color: _blackColor),
  ),
  fontFamily: GoogleFonts.saira().fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    // Title of Home and Strategic
    titleLarge: TextStyle(fontSize: _titleLargeSize),
    // Player names on PlayerCard, AddPlayerDialog, RemovePlayerDialog, Strategic
    titleMedium: TextStyle(fontSize: _titleMediumSize),
    // Numbers on PlayerCard & Strategic
    bodyMedium: TextStyle(fontSize: _titleMediumSize),
  ),
//   buttonTheme: ,
);

ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);
