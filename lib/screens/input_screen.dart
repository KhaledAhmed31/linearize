import 'package:flutter/material.dart';
import 'package:linearize/logic/solve.dart';
import 'package:linearize/parts/matrix/matrix.dart';
import 'package:linearize/parts/matrix/matrix_model.dart';
import 'package:linearize/parts/buttons/regural_button.dart';
import 'package:linearize/screens/solution_screen.dart';

class InputScreen extends StatelessWidget {
  static const String routeName = 'input';
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formControl = GlobalKey<FormState>();
    var matrixModel = ModalRoute.of(context)!.settings.arguments as MatrixModel;
    List<TextEditingController> controllers = List.generate(
      matrixModel.row * matrixModel.col,
      (index) => TextEditingController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LINEARIZE',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Input matrix",
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          Form(
            key: formControl,
            child: Matrix(
              row: matrixModel.row,
              col: matrixModel.col,
              controllers: controllers,
            ),
          ),
          const Text(
            'Solve by :',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 155,
            child: ReguralButton(
              title: 'Jordan',
              onPressed: () {
                if (formControl.currentState!.validate()) {
                  List<String> values = List.generate(
                    controllers.length,
                    (index) => controllers[index].text,
                  );
                  Solve.isJordan = true;
                  Navigator.pushNamed(context, SolutionScreen.routeName,
                      arguments: {0: matrixModel, 1: values});
                }
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ReguralButton(
            title: 'Gaussian',
            onPressed: () {
              if (formControl.currentState!.validate()) {
                List<String> values = List.generate(
                  controllers.length,
                  (index) => controllers[index].text,
                );
                Solve.isJordan = false;
                Navigator.pushNamed(context, SolutionScreen.routeName,
                    arguments: {0: matrixModel, 1: values});
              }
            },
          )
        ],
      ),
    );
  }
}
