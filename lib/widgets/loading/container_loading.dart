import 'package:flutter/material.dart';

class ContainerLoading extends StatelessWidget {
  const ContainerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 5),
      child: Row(
        children: [
          Container(
            width: 170,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 170,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}