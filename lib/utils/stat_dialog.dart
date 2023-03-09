import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

enum DialogType { monster, level, bonus }

class StatDialog extends StatefulWidget {
  final DialogType type;
  const StatDialog({super.key, required this.type});

  @override
  State<StatDialog> createState() => _StatDialogState();
}

class _StatDialogState extends State<StatDialog> {
  int _baseIndex = 1;

  @override
  Widget build(BuildContext context) {
	// TODO: add level and bonus option
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
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 52,
                diameterRatio: 1.2,
                useMagnifier: true,
                magnification: 1.6,
                onSelectedItemChanged: (index) {
                  _baseIndex = index + 1;
                },
                children: List.generate(20, (index) {
                  return Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                      fontSize: 38.0,
                    ),
                  );
                }, growable: false),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<BattleCubit>().addMonster(_baseIndex);
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
