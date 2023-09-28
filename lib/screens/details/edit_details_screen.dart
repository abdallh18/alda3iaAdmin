import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/Custom_button.dart';
import '../../widgets/custom/custom_text_from_faild.dart';
import 'details_screen.dart';

class EditDetails extends StatefulWidget {
  const EditDetails(
      {super.key,
      required this.detailsdocID,
      required this.name,
      required this.categorydocID});
  final String detailsdocID;
  final String categorydocID;
  final String name;
  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController details = TextEditingController();

  editdetails() async {
    CollectionReference collectiinDetails = FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.categorydocID)
        .collection("details");
    if (formstate.currentState!.validate()) {
      try {
        await collectiinDetails
            .doc(widget.detailsdocID)
            .update({"details": details.text});
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            categoeyId: widget.categorydocID,
            name: widget.name,
          ),
        ));
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  void initState() {
    details.text = widget.name;
    super.initState();
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
        title: const Text("Edit details"),
      ),
      body: BodyEditDetails(
        formstate: formstate,
        name: details,
        adddetails: editdetails,
      ),
    );
  }
}

class BodyEditDetails extends StatelessWidget {
  const BodyEditDetails(
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
               isSelected: true,
              name: "Save",
              onPressed: adddetails,
            ),
          ],
        ));
  }
}
