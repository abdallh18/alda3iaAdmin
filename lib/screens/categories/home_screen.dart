import 'package:alda3iaapp/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widgets/bodys/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alda3ia",
          style: TextStyle(
            color: blueColors,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColors,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(kAddCategories);
        },
      ),
      body: const SafeArea(
        child: BodyHomeScreen(),
      ),
    );
  }
}
