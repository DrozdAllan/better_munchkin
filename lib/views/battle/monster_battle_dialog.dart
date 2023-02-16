import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class MonsterBattleDialog extends StatefulWidget {
  const MonsterBattleDialog({super.key});

  @override
  State<MonsterBattleDialog> createState() => _MonsterBattleDialogState();
}

class _MonsterBattleDialogState extends State<MonsterBattleDialog> {
  int _monsterPower = 1;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        'Monster\'s Power',
        textAlign: TextAlign.center,
      ),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.4,
              child: ListWheelScrollView(
                itemExtent: 52,
                diameterRatio: 1.2,
                useMagnifier: true,
                magnification: 1.6,
                onSelectedItemChanged: (index) {
                  _monsterPower = index + 1;
                },
                children: List.generate(20, (index) {
                  return Text(
                    (index + 1).toString(),
                    //   widget.player.level.toString(),
                    style: const TextStyle(
                      fontSize: 38.0,
                    ),
                  );
                }, growable: false),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<BattleCubit>().addMonster(_monsterPower);
                Navigator.pop(context);
              },
              child: const Text(
                'Add Monster',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
