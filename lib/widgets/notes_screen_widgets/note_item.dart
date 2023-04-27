import 'package:flutter/material.dart';
import 'package:flutter_note_app/cubit/note_cubit.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/screens/edit_note_screen.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Get.isDarkMode? ThemeColors.noteItemBg : Color(note.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 16,
          ),
          ListTile(
            title: Text(
              note.title,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 26),
              ),
            ),
            subtitle: Text(
              note.subTitle,
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
                    note.delete();
                    NoteCubit.get(context).readNotes();
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
                    Get.to(EditNotesScreen(noteEdit: note,));
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
              note.date,
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
