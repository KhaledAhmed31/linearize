import 'package:flutter/material.dart';
import 'package:linearize/theme/my_colors.dart';

class OutputMatrix extends StatelessWidget {
  final List<double> vals;
  final int row, col;
  const OutputMatrix(
      {super.key, required this.row, required this.col, required this.vals});

  @override
  Widget build(BuildContext context) {
    List<double> nums = vals;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: (col > row) ? EdgeInsets.only(top: (col - row) * 1.4) : null,
      margin: const EdgeInsets.symmetric(vertical: 40),
      width: 50 * col.toDouble() + 20,
      height: (row > col)
          ? 40 * row.toDouble() + 22 + (row / 2 * 20)
          : 48 * row.toDouble() + 20 + (row * 1.7),
      constraints: BoxConstraints(
          maxWidth: screenWidth - 30, maxHeight: screenHeight * .41),
      decoration: BoxDecoration(
          color: MyColors.buttoms,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.buttoms, width: 4)),
      child: Center(
        child: GridView.builder(
          physics: (row > 6)
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemCount: row * col,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: col,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.white),
              child: Center(
                  child: Text((nums[index].ceil() == nums[index]
                          ? nums[index].toInt()
                          : nums[index].toStringAsFixed(2))
                      .toString())),
            );
          },
        ),
      ),
    );
  }
}
