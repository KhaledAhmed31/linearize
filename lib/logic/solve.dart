import 'package:flutter/material.dart';
import 'package:linearize/theme/my_colors.dart';

class Solve {
  static List<double> step1 = [];
  static List<double> step2 = [];
  static List<double> step3 = [];
  static bool isJordan = true;
  static Text solve(
      {required List<String> values, required int rows, required int cols}) {
    // إنشاء المصفوفة المتكاملة (حجز مساحة في الذاكرة)

    List<List<double>> augmentedMatrix = List.generate(
      rows,
      (_) => List.filled(cols, 0.0),
    );

    // تعبئة المصفوفة بالقيم المدخلة
    int valueIndex = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        augmentedMatrix[i][j] = double.parse(values[valueIndex]);
        valueIndex++;
      }
    }

    // تطبيق العمليات على الصفوف (طريقة غاوس-جوردان)
    for (int i = 0; i < rows; i++) {
      if (i == 0) {
        makeNoZeros(augmentedMatrix: augmentedMatrix, cols: cols, rows: rows);
      }

      // التأكد من أن العنصر الرئيسي في القطر ليس صفراً
      if (augmentedMatrix[i][i] == 0) {
        bool swapped = false;
        for (int k = i + 1; k < rows; k++) {
          if (augmentedMatrix[k][i] != 0) {
            for (int j = 0; j < cols; j++) {
              double temp = augmentedMatrix[i][j];
              augmentedMatrix[i][j] = augmentedMatrix[k][j];
              augmentedMatrix[k][j] = temp;
            }
            swapped = true;
            break;
          }
        }
        if (!swapped) {
          continue;
        }
      }

      if (i == 0) {
        makeOnes(values: step1, cols: cols, rows: rows);
      }
      // جعل العنصر الرئيسي في القطر يساوي 1
      double divisor = augmentedMatrix[i][i];
      for (int j = 0; j < cols; j++) {
        augmentedMatrix[i][j] /= divisor;
      }

      // جعل باقي عناصر العمود i تساوي 0
      for (int j = 0; j < rows; j++) {
        if (i != j) {
          double factor = augmentedMatrix[j][i];
          for (int k = 0; k < cols; k++) {
            augmentedMatrix[j][k] -= factor * augmentedMatrix[i][k];
          }
        }
      }

      if (i == rows - 1 && isJordan) {
        List<double> temp3 = [];

        for (int i = 0; i < rows; i++) {
          for (int j = 0; j < cols; j++) {
            temp3.add(augmentedMatrix[i][j]);
          }
        }
        step3 = temp3;
      }

      if (i == rows - 1 && !isJordan) {
        makeLowOnes(values: step2, rows: rows, cols: cols);
      }
    }

    // التحقق من عدم وجود حلول أو وجود حلول غير محدودة
    bool hasNoSolution = false;
    bool hasInfiniteSolutions = false;
    int independentRows = 0;

    for (int i = 0; i < rows; i++) {
      bool allZero = true;
      for (int j = 0; j < cols - 1; j++) {
        if (augmentedMatrix[i][j] != 0) {
          allZero = false;
          break;
        }
      }
      if (allZero && augmentedMatrix[i][cols - 1] != 0) {
        hasNoSolution = true;
        break;
      } else if (!allZero) {
        independentRows++;
      }
    }

    if (independentRows < cols - 1) hasInfiniteSolutions = true;

    // طباعة النتائج
    if (hasNoSolution) {
      return Text(
        textAlign: TextAlign.center,
        "The system has no solutions.",
        style: TextStyle(
            color: MyColors.buttoms, fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else if (hasInfiniteSolutions) {
      return Text(
        textAlign: TextAlign.center,
        "The system has an infinite number of solutions.",
        style: TextStyle(
            color: MyColors.buttoms, fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else {
      List<double> variables = List.filled(rows, 0.0);
      for (int i = 0; i < rows; i++) {
        variables[i] = augmentedMatrix[i][cols - 1];
      }

      String result = """""";
      for (int i = 0; i < variables.length; ++i) {
        result +=
            "x${i + 1} = ${(variables[i].ceil() == variables[i]) ? variables[i].toInt() : variables[i].toStringAsFixed(3)} \n";
      }
      return Text(
        result,
        style: TextStyle(
            color: MyColors.buttoms, fontSize: 24, fontWeight: FontWeight.bold),
      );
    }
  }

  static void makeNoZeros(
      {required List<List<double>> augmentedMatrix,
      required int rows,
      required int cols}) {
    List<List<double>> field = augmentedMatrix;
    for (int i = 0; i < rows; ++i) {
      if (field[i][i] == 0) {
        bool swapped = false;
        for (int k = i + 1; k < rows; k++) {
          if (field[k][i] != 0) {
            for (int j = 0; j < cols; j++) {
              double temp = field[i][j];
              field[i][j] = field[k][j];
              field[k][j] = temp;
            }
            swapped = true;
            break;
          }
        }
        if (!swapped) {
          continue;
        }
      }
    }
    List<double> temp1 = [];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        temp1.add(field[i][j]);
      }
    }
    step1 = temp1;
  }

  static void makeOnes(
      {required List<double> values, required int rows, required int cols}) {
    List<List<double>> temp = List.generate(
      rows,
      (index) => List.filled(cols, 0.0),
    );
    int valueIndex = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        temp[i][j] = values[valueIndex];
        valueIndex++;
      }
    }

    for (int i = 0; i < rows; ++i) {
      double divisor = temp[i][i];
      for (int j = 0; j < cols; j++) {
        temp[i][j] /= divisor;
      }
    }

    List<double> temp2 = [];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        temp2.add(temp[i][j]);
      }
    }
    step2 = temp2;
  }

// جعل العناصر أسفل العنصر الرئيسي تساوي 0 فقط
  static void makeLowOnes(
      {required List<double> values, required int rows, required int cols}) {
    List<List<double>> fields = List.generate(
      rows,
      (index) => List.filled(cols, 0.0),
    );
    int valueIndex = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        fields[i][j] = values[valueIndex];
        valueIndex++;
      }
    }

    for (int i = 0; i < rows; i++) {
      for (int j = i + 1; j < rows; j++) {
        double factor = fields[j][i] / fields[i][i];
        for (int k = 0; k < cols; k++) {
          fields[j][k] -= factor * fields[i][k];
        }
      }
    }
    for (int i = 0; i < rows; ++i) {
      double divisor = fields[i][i];
      for (int j = 0; j < cols; j++) {
        fields[i][j] /= divisor;
      }
    }
    List<double> temp3G = [];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        temp3G.add(fields[i][j]);
      }
    }
    step3 = temp3G;
  }
}
