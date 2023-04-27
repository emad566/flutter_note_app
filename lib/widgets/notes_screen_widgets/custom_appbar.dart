import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Notes',
          style: TextStyle(
            color: ThemeColors.appBarFrontText,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        const CustomSearchIcon(),

      ],
    );
  }
}



