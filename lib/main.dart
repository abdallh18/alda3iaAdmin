import "package:alda3iaapp/screens/categories/add_screen.dart";
import "package:alda3iaapp/screens/categories/home_screen.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

import "constant/colors.dart";
import "constant/constant.dart";


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: backGroungColors,
          titleTextStyle: TextStyle(
              color: blueColors, fontSize: 17, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(
            color: blueColors,
          ),
        ),
        scaffoldBackgroundColor: backGroungColors,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        kAddCategories: (context) => const AddCategories(),
      },
    );
  }
}
