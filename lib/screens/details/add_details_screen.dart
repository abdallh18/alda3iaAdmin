import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/Custom_button.dart';
import '../../widgets/custom/custom_text_from_faild.dart';
import 'details_screen.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key, required this.docID, required this.name});
  final String docID;
  final String name;
  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController details = TextEditingController();

  adddetails() async {
    CollectionReference collectiinDetails = FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.docID)
        .collection("details");
    if (formstate.currentState!.validate()) {
      try {
        DocumentReference response = await collectiinDetails.add({
          "details": details.text,
          "time":FieldValue.serverTimestamp(),
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            categoeyId: widget.docID,
            name: widget.name,
          ),
        ));
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    details.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add details"),
      ),
      body: BodyAddDetails(
        formstate: formstate,
        name: details,
        adddetails: adddetails,
      ),
    );
  }
}

class BodyAddDetails extends StatelessWidget {
  const BodyAddDetails(
      {super.key,
      required this.formstate,
      required this.name,
      required this.adddetails});
  final Key formstate;
  final TextEditingController name;
  final void Function() adddetails;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
        child: Column(
          children: [
            CustomTextFormFaild(
              name: name,
              textHint: "Enter your Details",
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
