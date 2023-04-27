import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ThemeColors.noteItemBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 16,),
          ListTile(
            title: Text(
              'Text Testing flutter',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 26),
              ),
            ),
            subtitle: Text(
              'subtitle',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 28,
                color: context.theme.colorScheme.background,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24, top: 16, bottom: 24),
            child: Text(
              'April 21, 2023',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: context.theme.textTheme.titleSmall!.color!.withOpacity(.8),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
