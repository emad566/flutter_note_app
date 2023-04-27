import 'package:flutter/material.dart';
import 'package:flutter_note_app/screens/edit_note_screen.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
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
          const SizedBox(
            height: 16,
          ),
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
            trailing: Column(
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.delete,
                    size: 22,
                    color: context.theme.colorScheme.background,
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    Get.to(const EditNotesScreen());
                  },
                  child: Icon(
                    Icons.edit,
                    size: 22,
                    color: context.theme.colorScheme.background,
                  ),
                ),
              ],
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
                  color: context.theme.textTheme.titleSmall!.color!
                      .withOpacity(.8),
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
