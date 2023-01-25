import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_munchkin/views/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munchkin En Mieux',
      theme: FlexThemeData.light(scheme: FlexScheme.damask),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.damask),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
