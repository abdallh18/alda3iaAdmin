import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom/Custom_button.dart';
import '../../widgets/custom/custom_text_from_faild.dart';
import 'package:path/path.dart';

import 'details2_screen.dart';

class AddDetailsTwo extends StatefulWidget {
  const AddDetailsTwo(
      {super.key,
      required this.categoriesdocID,
      required this.detailsId,
      required this.nameDetails});
  final String categoriesdocID;
  final String detailsId;
  final String nameDetails;
  @override
  State<AddDetailsTwo> createState() => _AddDetailsTwoState();
}

class _AddDetailsTwoState extends State<AddDetailsTwo> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController detailsTwo = TextEditingController();
  TextEditingController title = TextEditingController();
  File? file;
  String? urlImage;

  adddetailsTwo(context) async {
    CollectionReference collectiinDetails = FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.categoriesdocID)
        .collection("details")
        .doc(widget.detailsId)
        .collection("detailstwo");
    if (formstate.currentState!.validate()) {
      try {
        DocumentReference response = await collectiinDetails.add({
          "detailstwo": detailsTwo.text,
          "url": urlImage ?? "none",
          "title": title.text,
          "time":FieldValue.serverTimestamp(),
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailsTwoScreen(
              categoeyId: widget.categoriesdocID,
              detailsId: widget.detailsId,
              nameDetails: widget.nameDetails,
            );
          },
        ));
      } catch (e) {
        print("Error $e");
      }
    }
  }

  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      
      file = File(imageGallery.path);
      var imagename = basename(imageGallery.path);
      var rerStoreg = FirebaseStorage.instance.ref("images").child(imagename);
      await rerStoreg.putFile(file!);
      urlImage = await rerStoreg.getDownloadURL();
    }
    setState(() {});
  }

  @override
  void dispose() {
    detailsTwo.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add details Two"),
      ),
      body: BodyAddDetailsTwo(
        title: title,
        formstate: formstate,
        name: detailsTwo,
        adddetails: () async {
          await adddetailsTwo(context);
        },
        getImage: () async {
          await getImage();
        },
        urlImage: urlImage ?? "none",
      ),
    );
  }
}

class BodyAddDetailsTwo extends StatelessWidget {
  const BodyAddDetailsTwo(
      {super.key,
      required this.formstate,
      required this.name,
      required this.adddetails,
      required this.urlImage,
      required this.getImage,
      required this.title});
  final Key formstate;
  final TextEditingController name;
  final TextEditingController title;
  final void Function() adddetails;
  final void Function() getImage;
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFaild(
              name: name,
              textHint: "Enter your DetailsTwo",
            ),
            CustomTextFormFaild(
              name: title,
              textHint: "Enter your Title",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              // ignore: unnecessary_null_comparison
              isSelected: urlImage == "none" ? false : true,
              name: "Uplaod Image",
              onPressed: getImage,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              isSelected: false,
              name: "add",
              onPressed: adddetails,
            ),
          ],
        ));
  }
}
