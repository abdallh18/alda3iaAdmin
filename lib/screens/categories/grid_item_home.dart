import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/custom/custom_item_home.dart';

class GridItemHome extends StatelessWidget {
  const GridItemHome({super.key, required this.data});
  final List<QueryDocumentSnapshot> data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return CustomItemHome(
              name: "${data[index]['name']}",
              id: data[index].id,
            );
          },
        ),
      ),
    );
  }
}
