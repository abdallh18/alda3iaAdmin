import 'package:alda3iaapp/constant/colors.dart';
import 'package:alda3iaapp/constant/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/bodys/body_add_screen.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");
  addcategories() async {
    if (formstate.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add({
          "name": name.text,
          "time":FieldValue.serverTimestamp(),
        });
        Navigator.of(context)
            .pushNamedAndRemoveUntil(khomeScreen, (route) => false);
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body:BodyAddScreen(
        formstate: formstate,
        name: name,
        addcategories: addcategories,
      ), 
    );
  }
}
