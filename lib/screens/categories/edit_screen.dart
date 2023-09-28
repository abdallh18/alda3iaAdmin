import 'package:alda3iaapp/constant/constant.dart';
import 'package:alda3iaapp/widgets/custom/Custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/custom_text_from_faild.dart';

class EditCategories extends StatefulWidget {
  const EditCategories({super.key, required this.docid, required this.oldName});
  final String docid;
  final String oldName;
  @override
  State<EditCategories> createState() => _EditCategoriesState();
}

class _EditCategoriesState extends State<EditCategories> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");
  editcategories() async {
    if (formstate.currentState!.validate()) {
      try {
        await categories.doc(widget.docid).update({"name": name.text});
        Navigator.of(context)
            .pushNamedAndRemoveUntil(khomeScreen, (route) => false);
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.oldName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Form(
          key: formstate,
          child: Column(
            children: [
              CustomTextFormFaild(
                name: name,
              ),
              CustomButton(
                onPressed: editcategories,
                name: "Save",
                isSelected: true,
              ),
            ],
          )),
    );
  }
}
