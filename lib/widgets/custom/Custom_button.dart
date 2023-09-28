import 'package:alda3iaapp/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.name,
      required this.isSelected});
  final void Function() onPressed;
  final String name;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      // style: Mater.styleFrom(
      //   backgroundColor: blueColors,
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),
      color: isSelected ? Colors.green : blueColors,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 50,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Text(name),
      ),
    );
  }
}
