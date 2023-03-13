import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/string_casing_extension.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog({super.key});

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  List<Color> lightColors = const [
    Color(0xFFffbcaf),
    Color(0xFFffb2ff),
    Color(0xFFffffb1),
    Color(0xFFFFDE9C),
    Color(0xFFb5ffff),
    Color(0xFFc0cfff),
    Color(0xFFe1ffb1),
    Color(0xFF8EDBCE),
  ];

  List<Color> darkColors = const [
    Color(0xFFef6c00),
    Color(0xFF6a1b9a),
    Color(0xFFc62828),
    Color(0xFF9f0000),
    Color(0xFF0277bd),
    Color(0xFF283593),
    Color(0xFF558b2f),
    Color(0xFF00695c),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Color> chosenPalette =
        Theme.of(context).brightness == Brightness.light
            ? lightColors
            : darkColors;
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(8.0),
      children: [
        Column(
          children: [
            TextFormField(
              key: _formFieldKey,
              textAlign: TextAlign.start,
              controller: _name,
              decoration: InputDecoration(
                  label:
                      Center(child: Text(AppLocalizations.of(context)!.name)),
                  border: const OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.nameRule1;
                }
                if (value.length > 15) {
                  return AppLocalizations.of(context)!.nameRule2;
                }
                for (Player player in context.read<PlayerCubit>().state) {
                  if (player.name == value.toTitleCase()) {
                    return AppLocalizations.of(context)!.nameRule3;
                  }
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.75,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 8.0),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: [
                  for (Color color in chosenPalette)
                    GestureDetector(
                      onTap: () {
                        if (_formFieldKey.currentState!.validate()) {
                          context.read<PlayerCubit>().addPlayer(Player(
                              name: _name.text.toTitleCase(),
                              colorId: color.value,
                              level: 1,
                              bonus: 0,
                              strength: 1));
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(color: color, shape: BoxShape.circle),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
