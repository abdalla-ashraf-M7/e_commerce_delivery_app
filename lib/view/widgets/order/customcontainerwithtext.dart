import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomContainerWithText extends StatelessWidget {
  const CustomContainerWithText({super.key, required this.words, required this.backcolor});
  final String words;
  final Color backcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: backcolor),
      height: 45,
      child: Text(
        words,
        style: const TextStyle(fontSize: 25, color: Appcolors.white),
      ),
    );
  }
}
