import 'dart:io';

import 'package:alda3iaapp/screens/details2/details2_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../widgets/custom/Custom_button.dart';
import '../../widgets/custom/custom_text_from_faild.dart';

class EditDetailsTwo extends StatefulWidget {
  const EditDetailsTwo({
    super.key,
    required this.detailsdocID,
    required this.categorydocID,
    required this.nameDetailsTwo,
    required this.nameDetails,
    required this.detailsTwodocId,
    required this.titleDetailsTwo,
  });
  final String detailsdocID;
  final String categorydocID;
  final String nameDetailsTwo;
  final String nameDetails;
  final String detailsTwodocId;
  final String titleDetailsTwo;
  @override
  State<EditDetailsTwo> createState() => _EditDetailsTwoState();
}

class _EditDetailsTwoState extends State<EditDetailsTwo> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController detailsTwo = TextEditingController();
  TextEditingController detailstitle = TextEditingController();
  File? file;

  editdetailsTwo(context) async {
    CollectionReference collectiinDetails = FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.categorydocID)
        .collection("details")
        .doc(widget.detailsdocID)
        .collection("detailstwo");
    if (formstate.currentState!.validate()) {
      try {
        await collectiinDetails.doc(widget.detailsTwodocId).update({
          "detailstwo": detailsTwo.text,
          "title": detailstitle.text,
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsTwoScreen(
                categoeyId: widget.categorydocID,
                detailsId: widget.detailsdocID,
                nameDetails: widget.nameDetails),
          ),
        );
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  void initState() {
    detailsTwo.text = widget.nameDetailsTwo;
    detailstitle.text = widget.titleDetailsTwo;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    detailsTwo.dispose();
    detailstitle.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit details Two"),
      ),
      body: BodyEditDetailsTwo(
        title: detailstitle,
        formstate: formstate,
        name: detailsTwo,
        adddetails: () async {
          await editdetailsTwo(context);
        },
      ),
    );
  }
}

class BodyEditDetailsTwo extends StatelessWidget {
  const BodyEditDetailsTwo(
      {super.key,
      required this.formstate,
      required this.name,
      required this.adddetails,
      required this.title});
  final Key formstate;
  final TextEditingController name;
  final TextEditingController title;
  final void Function() adddetails;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
        child: Column(
          children: [
            CustomTextFormFaild(
              name: name,
              textHint: "Enter your Details Two",
            ),
            CustomTextFormFaild(
              name: title,
              textHint: "Enter your Title",
            ),
            CustomButton(
              isSelected: true,
              name: "Save",
              onPressed: adddetails,
            ),
          ],
        ));
  }
}
