import 'package:alda3iaapp/constant/colors.dart';
import 'package:alda3iaapp/constant/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'details_item.dart';
import 'add_details_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key, required this.name, required this.categoeyId});
  final String name;
  final String categoeyId;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.categoeyId)
        .collection("details").orderBy("time")
        .get();
    data.addAll(querySnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColors,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddDetails(
              docID: widget.categoeyId,
              name: widget.name,
            ),
          ));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
        toolbarHeight: 70,
      ),
      body: WillPopScope(
        child: isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: ListView.builder(
                    
                    itemCount: data.length,
                    itemBuilder: (context, index) => CustomDetailsItem(
                      stringitemDetails: data[index]["details"],
                      categorydocId: widget.categoeyId,
                      detailsdocId: data[index].id,
                      nameCategory: widget.name,
                    ),
                  ),
                ),
              ),
        onWillPop: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(khomeScreen, (route) => false);
          return Future.value(false);
        },
      ),
    );
  }
}
