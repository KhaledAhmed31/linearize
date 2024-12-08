import 'package:flutter/material.dart';
import 'package:linearize/theme/my_colors.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class IncDecButton extends StatefulWidget {
  final TextEditingController controller;
  final int min;
  final double height;
  final double widht;
  const IncDecButton(
      {required this.controller,
      super.key,
      required this.height,
      required this.widht,
      required this.min});

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: widget.height,
        width: widget.widht,
        child: NumberInputWithIncrementDecrement(
          incDecBgColor: const Color.fromARGB(115, 192, 193, 255),
          numberFieldDecoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.buttoms, width: 2),
                borderRadius: BorderRadius.circular(15)),
          ),
          widgetContainerDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyColors.buttoms, width: 4)),
          controller: widget.controller,
          min: widget.min,
          max: 10,
          initialValue: widget.min,
        ),
      ),
    );
  }
}
