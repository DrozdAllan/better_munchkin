import 'package:better_munchkin/provider/player_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(playerProvider);
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.only(top: 0.0),
        childAspectRatio: 3,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          for (Player player in provider)
            Container(
              color: Color(player.colorId),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      player.name.toString().toUpperCase(),
                      style: const TextStyle(fontSize: 28.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
						onTap: () {
						  // TODO: https://pub.dev/packages/sleek_circular_slider
						},
						child: Column(
						  children: [
							const Icon(
							  RpgAwesome.corked_tube,
							),
							Text(player.level.toString(),
								style: const TextStyle(fontSize: 38.0)),
						  ],
						),
					  ),
                      Column(
                        children: [
                          const Icon(
                            RpgAwesome.large_hammer,
                            //   color: Colors.white
                          ),
                          Text(player.bonus.toString(),
                              style: const TextStyle(fontSize: 38.0)),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            RpgAwesome.targeted,
                          ),
                          Text(player.power.toString(),
                              style: const TextStyle(fontSize: 38.0)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        ],
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
