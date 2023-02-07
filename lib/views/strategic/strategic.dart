import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Strategic extends StatefulWidget {
  const Strategic({super.key});

  @override
  State<Strategic> createState() => _StrategicState();
}

class _StrategicState extends State<Strategic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlayerCubit, List<Player>>(
        builder: (context, state) {
          return GridView.count(
            childAspectRatio: 2,
            // TODO: finish responsive for 2 orientations
            crossAxisCount: MediaQuery.of(context).size.height >
                    MediaQuery.of(context).size.width
                ? 2
                : 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: [
              for (Player player in state)
                Container(
                  decoration: BoxDecoration(
                      color: Color(player.colorId),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          player.name,
                          style: const TextStyle(fontSize: 28.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                RpgAwesome.corked_tube,
                              ),
                              // TODO: wrap with levelDialog()
                              Text(player.level.toString(),
                                  style: const TextStyle(fontSize: 38.0)),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                RpgAwesome.large_hammer,
                                //   color: Colors.white
                              ),
                              // TODO: wrap with bonusDialog()
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
          );
        },
      ),
    );
  }
}
