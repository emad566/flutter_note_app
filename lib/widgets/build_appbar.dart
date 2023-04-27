import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:flutter_note_app/services/theme_services.dart';
import 'package:get/get.dart';

AppBar buildAppBar({
  required Function setState,
  required BuildContext context,
  bool isShowLeading = true,
  Row? actionRow,
}) {

  return AppBar(
    automaticallyImplyLeading: isShowLeading,
    leading: isShowLeading ? IconButton(
      onPressed: (){
        Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteClr,
            ),
          )
        : Container(),
    actions: [
      SizedBox(width: isShowLeading? 50 : 20),
      if(actionRow!=null)
        Expanded(child: actionRow),

      IconButton(
        onPressed: (){
          setState(() {
            ThemeServices().switchTheme();
          });
        },
        icon: Get.isDarkMode?
        const Icon(Icons.nightlight_outlined, size: 24, color: whiteClr,)
            :
        const Icon(Icons.wb_sunny_outlined, size: 24, color: whiteClr,),
      ),


    ],
    elevation: 0,
    backgroundColor: context.theme.colorScheme.background,
  );
}