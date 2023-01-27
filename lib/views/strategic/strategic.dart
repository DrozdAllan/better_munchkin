import 'package:better_munchkin/provider/player_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Strategic extends ConsumerStatefulWidget {
  const Strategic({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StrategicState();
}

class _StrategicState extends ConsumerState<Strategic> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

// TODO: try https://pub.dev/packages/flutter_staggered_grid_view
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(playerProvider);
    return Scaffold(
      body: Container(
        child: Center(
          child: GridView.count(
            padding: const EdgeInsets.only(top: 12.0),
            childAspectRatio: 2,
            crossAxisCount: 2,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 25.0,
            children: [
              for (Player player in provider)
                Container(
                  color: Color(player.colorId),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          player.name.toString().toUpperCase(),
                        ),
                      ),
                      Row(
						mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('level'),
                          Text('attack'),
                        ],
                      ),
                      Center(
                        child: Text(
                          player.power.toString().toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
