import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText, required this.controller, this.obscureText = false, this.suffixIcon, this.validator, this.borderColor, this.maxLines = 1}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function? validator;
  final Widget? suffixIcon;
  final Color? borderColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        validator: (val){ return validator != null? validator!() : null;},
        controller: controller,
        style: TextStyle(color: borderColor?? whiteClr,),
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: borderColor?? whiteClr,
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:  TextStyle(color: (borderColor?.withOpacity(0.3))?? whiteClr.withOpacity(0.5),),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderClr,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor?? whiteClr,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor?? whiteClr,
            ),
          ),
        ),
      ),
    );
  }
}
