import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class MonsterBattleDialog extends StatefulWidget {
  const MonsterBattleDialog({super.key});

  @override
  State<MonsterBattleDialog> createState() => _MonsterBattleDialogState();
}

class _MonsterBattleDialogState extends State<MonsterBattleDialog> {
  late int _monsterPower;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 224.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select the monster\'s power'),
            SizedBox(
              height: 140.0,
              width: 75.0,
              child: ListWheelScrollView(
                itemExtent: 52,
                diameterRatio: 1.2,
                useMagnifier: true,
                magnification: 1.4,
                onSelectedItemChanged: (index) {
                  _monsterPower = index;
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
            ElevatedButton(
              onPressed: () {
                context.read<BattleCubit>().addMonster(_monsterPower + 1);
                Navigator.pop(context);
              },
              child: const Text('add monster'),
            ),
          ],
        ),
      ),
    );
  }
}
