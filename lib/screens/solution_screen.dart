import 'package:flutter/material.dart';
import 'package:linearize/logic/solve.dart';
import 'package:linearize/parts/matrix/matrix_model.dart';
import 'package:linearize/parts/buttons/regural_button.dart';
import 'package:linearize/screens/steps_screen.dart';

class SolutionScreen extends StatelessWidget {
  static const String routeName = 'solution';
  const SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    MatrixModel matrixModel = args[0];
    List<String> values = args[1];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LINEARIZE',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Solution :',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Solve.solve(
                  values: values, rows: matrixModel.row, cols: matrixModel.col),
            ),
            SizedBox(
              width: 155,
              child: ReguralButton(
                title: 'Details',
                onPressed: () {
                  Navigator.pushNamed(context, StepScreen.routeName,
                      arguments: {
                        0: MatrixModel(
                            col: matrixModel.col, row: matrixModel.row),
                        1: "Step 1 : Make sure the main diagonal element is not zero by exchanging rows",
                        2: Solve.step1
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
