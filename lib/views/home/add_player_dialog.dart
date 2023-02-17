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
    Color(0xFFc0cfff),
    Color(0xFF8EDBCE),
    Color(0xFFe1ffb1),
    Color(0xFFb5ffff),
    Color(0xFFffffb1),
    Color(0xFFFFDE9C),
  ];

  List<Color> darkColors = const [
    Color(0xFFc62828),
    Color(0xFF6a1b9a),
    Color(0xFF283593),
    Color(0xFF0277bd),
    Color(0xFF00695c),
    Color(0xFF558b2f),
    Color(0xFFff8f00),
    Color(0xFFef6c00),
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(8.0),
      children: [
        Column(
          children: [
            TextFormField(
              key: _formFieldKey,
              textAlign: TextAlign.start,
              controller: _name,
              decoration: const InputDecoration(
                  label: Center(child: Text('Name')),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                if (value.length > 15) {
                  return '15 caracters maximum';
                }
                for (Player player in context.read<PlayerCubit>().state) {
                  if (player.name == value.toTitleCase()) {
                    return 'Name already taken';
                  }
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.75,
              width: MediaQuery.of(context).size.width,
              // TODO: I dont think gridview is the right widget if you dont want to scroll
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lightColors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (_formFieldKey.currentState!.validate()) {
                        context.read<PlayerCubit>().addPlayer(Player(
                            name: _name.text.toTitleCase(),
                            colorId: lightColors.elementAt(index).value,
                            level: 1,
                            bonus: 0,
                            power: 1));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: lightColors.elementAt(index),
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
