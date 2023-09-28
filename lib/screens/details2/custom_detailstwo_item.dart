import 'package:alda3iaapp/screens/details2/details2_screen.dart';
import 'package:alda3iaapp/screens/details2/edit_detailstwo.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../textandimage/text_image_screen.dart';

class CustomDetailsTwoItem extends StatelessWidget {
  const CustomDetailsTwoItem({
    super.key,
    required this.categorydocId,
    required this.detailsdocId,
    required this.detailstwodocId,
    required this.nameDetailsTwo,
    required this.nameDetails,
    required this.titleDetailsTwo,
    required this.urlImageDetailsTwo,
  });
  final String categorydocId;
  final String detailsdocId;
  final String detailstwodocId;
  final String nameDetailsTwo;
  final String nameDetails;
  final String titleDetailsTwo;
  final String urlImageDetailsTwo;

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
              builder: (context) => TextImageScreem(
                title: titleDetailsTwo,
                urlImage: urlImageDetailsTwo,
                nameDetailsTwo: nameDetailsTwo,
              ),
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
                  .collection("detailstwo")
                  .doc(detailstwodocId)
                  .delete();
              if (urlImageDetailsTwo != "none") {
                FirebaseStorage.instance
                    .refFromURL(urlImageDetailsTwo)
                    .delete();
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsTwoScreen(
                      categoeyId: categorydocId,
                      detailsId: detailsdocId,
                      nameDetails: nameDetails),
                ),
              );
            },
            btnOkOnPress: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditDetailsTwo(
                        detailsdocID: detailsdocId,
                        categorydocID: categorydocId,
                        nameDetailsTwo: nameDetailsTwo,
                        nameDetails: nameDetails,
                        detailsTwodocId: detailstwodocId,
                        titleDetailsTwo: titleDetailsTwo,
                      )));
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
            color: blue400,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              nameDetailsTwo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
