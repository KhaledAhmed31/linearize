import 'package:flutter/material.dart';
import 'package:linearize/theme/my_colors.dart';

class ReguralButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const ReguralButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          backgroundColor: MyColors.buttoms,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 22),
        ));
  }
}
