import 'package:alda3iaapp/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'grid_item_home.dart';

class HomeScreenData extends StatelessWidget {
  const HomeScreenData({super.key, required this.data});
  final List<QueryDocumentSnapshot> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const AppBarHomeScreen(),
        const Divider(
          color: blueColors,
          height: 0,
          thickness: 0.5,
        ),
        GridItemHome(data: data),
      ],
    );
  }
}
