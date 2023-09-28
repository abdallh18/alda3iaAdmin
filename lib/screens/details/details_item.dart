import 'package:alda3iaapp/screens/details/details_screen.dart';
import 'package:alda3iaapp/screens/details2/details2_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

import 'edit_details_screen.dart';

class CustomDetailsItem extends StatelessWidget {
  const CustomDetailsItem({
    super.key,
    required this.stringitemDetails,
    required this.categorydocId,
    required this.detailsdocId,
    required this.nameCategory,
  });
  final String stringitemDetails;
  final String categorydocId;
  final String detailsdocId;
  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>DetailsTwoScreen(categoeyId: categorydocId, detailsId: detailsdocId, nameDetails: stringitemDetails)
            ),
          );
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
                  .doc(categorydocId)
                  .collection("details")
                  .doc(detailsdocId)
                  .delete();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                    name: nameCategory, categoeyId: categorydocId),
              ));
            },
            btnOkOnPress: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditDetails(
                  categorydocID: categorydocId,
                  detailsdocID: detailsdocId,
                  name: stringitemDetails,
                ),
              ));
            },
          ).show();
        },
        child: Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: blueColors,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(stringitemDetails,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
          ),
        ),
      ),
    );
  }
}
