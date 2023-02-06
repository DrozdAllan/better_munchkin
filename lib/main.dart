import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/views/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logic/cubit/is_epic_cubit.dart';
import 'logic/cubit/player_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(providers: [
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
      title: 'Munchkin En Mieux',
	  // TODO: create custom theme
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
