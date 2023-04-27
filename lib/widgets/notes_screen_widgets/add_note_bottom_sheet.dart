import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/custom_button.dart';
import 'package:flutter_note_app/widgets/custom_input_field.dart';


class AddNoteBottomSheet extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  AddNoteBottomSheet({super.key, this.isEdit = false});
  final bool isEdit;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 750,
      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Note title',
              controller: _titleController,
            ),
            const SizedBox(height: 12,),
            CustomTextField(
              hintText: 'Note content',
              controller: _contentController,
              maxLines: 5,
            ),
            const SizedBox(height: 50,),
            CustomButton(
              label: isEdit? 'Update' : 'Add',
              onTab: (){},
            )
          ],
        ),
      ),
    );
  }
}
