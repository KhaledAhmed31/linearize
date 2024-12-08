import 'package:flutter/material.dart';

class MatrixInput extends StatelessWidget {
  final TextEditingController controller;
  const MatrixInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Empty";
          }
          return null;
        },
        showCursor: false,
        enableInteractiveSelection: false,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 11),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Color.fromARGB(255, 158, 127, 230)),
                borderRadius: BorderRadius.circular(10)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 11),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff6658c7)),
                borderRadius: BorderRadius.circular(4)),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
