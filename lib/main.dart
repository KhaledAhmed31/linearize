import 'package:flutter/material.dart';
import 'package:linearize/screens/input_screen.dart';
import 'package:linearize/screens/set_screen.dart';
import 'package:linearize/screens/solution_screen.dart';
import 'package:linearize/screens/steps_screen.dart';
import 'package:linearize/theme/my_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LINEARIZ',
      debugShowCheckedModeBanner: false,
      routes: {
        SetScreen.routeName: (_) => SetScreen(),
        InputScreen.routeName: (_) => const InputScreen(),
        SolutionScreen.routeName: (_) => const SolutionScreen(),
        StepScreen.routeName: (_) => const StepScreen()
      },
      theme: MyTheme.lightTheme,
    );
  }
}
