import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'container_loading.dart';

Shimmer loadingItem() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 70,
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     // borderRadius: BorderRadius.circular(30),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ContainerLoading(),
              ContainerLoading(),
              ContainerLoading(),
            ],
          ),
        ],
      ));
}
