import 'package:e_mart/utils/constants/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          Container(
            color: PColors.primary,
            padding: const EdgeInsets.all(0),
            
          )
        ],
      )),
    );
  }
}