import 'package:alda3iaapp/screens/details/details_screen.dart';
import 'package:alda3iaapp/screens/categories/edit_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/constant.dart';

class CustomItemHome extends StatelessWidget {
  const CustomItemHome({super.key, required this.name, required this.id});
  final String name;
  final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            name: name,
            categoeyId: id,
          ),
        ));
      },
      onLongPress: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          desc: "اختر ماذا تريد ",
          btnCancelText: "حذف",
          btnOkText: "تعديل",
          btnCancelOnPress: () async {
            await FirebaseFirestore.instance
                .collection("categories")
                .doc(id)
                .delete();
            Navigator.of(context).pushReplacementNamed(khomeScreen);
          },
          btnOkOnPress: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditCategories(docid: id, oldName: name),
            ));
          },
        ).show();
      },
      child: Container(
        width: 170,
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: blueColors,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
