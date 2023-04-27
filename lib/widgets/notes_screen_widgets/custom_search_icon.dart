import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: whiteClr.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Icon(
          Icons.search,
          size: 28,
          color: whiteClr,
        ),
      ),
    );
  }
}