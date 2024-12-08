import 'package:flutter/material.dart';
import 'package:linearize/logic/solve.dart';
import 'package:linearize/parts/matrix/matrix_model.dart';
import 'package:linearize/parts/matrix/output_matrix.dart';
import 'package:linearize/parts/buttons/regural_button.dart';

class StepScreen extends StatelessWidget {
  static const String routeName = 'step';
  static int stepNum = 1;
  const StepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    MatrixModel matrixModel = args[0];
    String descripion = args[1];
    List<double> stepMatrix = args[2];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LINEARIZE',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
            onPressed: () {
              if (stepNum > 1) --stepNum;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              textAlign: TextAlign.center,
              descripion,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
            ),
          ),
          OutputMatrix(
              row: matrixModel.row, col: matrixModel.col, vals: stepMatrix),
          (stepNum > 2)
              ? SizedBox(
                  width: 155,
                  child: ReguralButton(
                    title: 'Go home',
                    onPressed: () {
                      stepNum = 1;
                      Navigator.popUntil(
                          context, (route) => route.settings.name == '/');
                    },
                  ),
                )
              : SizedBox(
                  width: 155,
                  child: ReguralButton(
                    title: 'Next',
                    onPressed: () {
                      ++stepNum;
                      Navigator.pushNamed(context, StepScreen.routeName,
                          arguments: {
                            0: MatrixModel(
                                col: matrixModel.col, row: matrixModel.row),
                            1: "Step $stepNum : ${(stepNum == 2) ? "Make the diagonal elements equals one by multiply the row by a non zero constant" : (Solve.isJordan) ? "Make the rest of elements in the column equal zero by adding a multiple of one row to another" : "Make the elements under the leadings equal zero by adding a multiple of one row to another"}",
                            2: (stepNum == 2) ? Solve.step2 : Solve.step3
                          });
                    },
                  ),
                )
        ],
      )),
    );
  }
}
