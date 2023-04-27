import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color whiteClr = Colors.white;
const Color blackClr = Colors.black;
var grey200 = Colors.grey[200];
const errorClr = Colors.red;
const primaryClr = Color(0xFF444444);
const secondaryClr = Colors.yellow;
const darkSecondaryClr = Color(0xFF666666);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
const Color focusedBorderClr = Colors.green;

class ThemeColors{
  static Color get appBarFrontText => Get.isDarkMode? whiteClr : whiteClr;
  static Color get noteItemBg => Get.isDarkMode? darkSecondaryClr : secondaryClr;
  static Color get buttonText => Get.isDarkMode? whiteClr : blackClr;
  static Color get buttonBg => Get.isDarkMode? blackClr : whiteClr.withOpacity(.8);
}