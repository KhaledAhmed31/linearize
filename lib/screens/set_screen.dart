import 'package:flutter/material.dart';
import 'package:linearize/parts/buttons/inc_dec_button.dart';
import 'package:linearize/parts/matrix/matrix_model.dart';
import 'package:linearize/parts/buttons/regural_button.dart';
import 'package:linearize/screens/input_screen.dart';

class SetScreen extends StatelessWidget {
  final TextEditingController rowController = TextEditingController();
  final TextEditingController colController = TextEditingController();
  static const String routeName = '/';
  SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LINEARIZE',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Matrix dimensions",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(
            height: screenHeight * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IncDecButton(
                controller: rowController,
                height: 60,
                widht: 80,
                min: 2,
              ),
              Text(
                'x',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 50),
              ),
              IncDecButton(
                controller: colController,
                height: 60,
                widht: 80,
                min: 3,
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * .1,
          ),
          ReguralButton(
            title: 'Set matrix',
            onPressed: () {
              if (int.parse(colController.text) >= 2 &&
                  int.parse(rowController.text) >= 2) {
                Navigator.of(context).pushNamed(InputScreen.routeName,
                    arguments: MatrixModel(
                        col: int.parse(colController.text),
                        row: int.parse(rowController.text)));
              }
            },
          )
        ],
      ),
    );
  }
}
