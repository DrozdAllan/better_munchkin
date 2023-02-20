import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class Strategic extends StatelessWidget {
  const Strategic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategic View'),
      ),
      body: BlocBuilder<PlayerCubit, List<Player>>(
        builder: (context, state) {
          return GridView.count(
            childAspectRatio: 1.80,
            crossAxisCount: 2,
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
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                CustomIcons.corkedTube,
                              ),
                              // TODO: wrap with levelDialog()
                              Text(
                                player.level.toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                CustomIcons.largeHammer,
                                //   color: Colors.white
                              ),
                              // TODO: wrap with bonusDialog()
                              Text(
                                player.bonus.toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                CustomIcons.targeted,
                              ),
                              Text(
                                player.power.toString(),
                              ),
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
