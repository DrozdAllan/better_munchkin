import 'package:better_munchkin/logic/cubit/is_grid_cubit.dart';
import 'package:better_munchkin/style.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/views/home/home.dart';
import 'package:flutter/services.dart';

import 'logic/cubit/is_epic_cubit.dart';
import 'logic/cubit/player_cubit.dart';
import 'logic/cubit/battle_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => IsGridCubit()),
      BlocProvider(create: (context) => IsEpicCubit()),
      BlocProvider(create: (context) => PlayerCubit()),
      BlocProvider(create: (context) => BattleCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
