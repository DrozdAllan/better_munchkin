import 'dart:developer';
import 'dart:math';

import 'package:better_munchkin/utils/commons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class DiceWidget extends StatefulWidget {
  // TODO: LATER: Rive & 1 animation for each dice side
  // TODO: finish animations
  const DiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  bool isInit = false;

  List<int> diceIcons = const [59799, 59802, 59801, 59798, 59797, 59800];

  late Icon resultDice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: GestureDetector(
          onTap: () => diceRoll(),
          child: isInit == false
              ? const Icon(
                  RpgAwesome.perspective_dice_six_two,
                  size: 52.0,
                )
              : resultDice),
    );
  }

  void diceRoll() {
    // random from 0 to 5 because I use diceIcons index
    int diceResult = Random().nextInt(6);
    if (isInit == false) {
      setState(() {
        isInit = true;
      });
    }
    setState(() {
      resultDice = Icon(
        IconData(diceIcons.elementAt(diceResult),
            fontFamily: "RpgAwesome", fontPackage: "fluttericon"),
        size: 48.0,
      );
    });
  }
}
