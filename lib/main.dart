import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tortoise_assignment/pages/device_catalog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Scaffold(body: BrandCatalogPage()),
    );
  }
}
