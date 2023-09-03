import 'package:delivery_e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, this.tap});
  final String text;
  final void Function()? tap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              backgroundColor: const MaterialStatePropertyAll(Appcolors.primarycolor)),
          onPressed: tap,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          )),
    );
  }
}
