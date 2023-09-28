import 'package:flutter/material.dart';

import '../custom/Custom_button.dart';
import '../custom/custom_text_from_faild.dart';

class BodyAddScreen extends StatelessWidget {
  const BodyAddScreen(
      {super.key,
      required this.formstate,
      required this.name,
      required this.addcategories});
  final Key formstate;
  final TextEditingController name;
  final void Function() addcategories;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
        child: Column(
          children: [
            CustomTextFormFaild(
              name: name,
            ),
            CustomButton(
              name: "add",
              onPressed: addcategories,
              isSelected: false,
            ),
          ],
        ));
  }
}
