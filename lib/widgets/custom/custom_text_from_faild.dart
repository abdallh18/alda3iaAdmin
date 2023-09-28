import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild(
      {super.key,
      required this.name,
      this.textHint = "Enter the new categories"});
  final TextEditingController name;
  final String textHint;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextField(
        controller: name,
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: blueColors,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: blueColors,
            ),
          ),
          hintText: textHint,
          hintStyle: const TextStyle(fontSize: 18, color: blueColors),
          fillColor: blueColors,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: blueColors),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
