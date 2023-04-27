import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/custom_button.dart';
import 'package:flutter_note_app/widgets/custom_input_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
    this.isEdit = false,
  });

  final bool isEdit;

  static final GlobalKey<FormState> formKey = GlobalKey();
  static final TextEditingController _titleController = TextEditingController();
  static final TextEditingController _contentController = TextEditingController();
  static final GlobalKey<FormFieldState> inputKeyTitle = GlobalKey();
  static final GlobalKey<FormFieldState> inputKeyContent = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 32,
        left: 24,
        right: 24,
      ),
      child: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: buildAddForm(),
      ),
    );
  }

  Form buildAddForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            inputKey: inputKeyTitle,
            hintText: 'Note title',
            controller: _titleController,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            inputKey: inputKeyContent,
            hintText: 'Note content',
            controller: _contentController,
            textInputAction: TextInputAction.done,
            maxLines: 5,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            label: isEdit ? 'Update' : 'Add',
            onTab: () {
              if (formKey.currentState!.validate()) {

              } else {

              }
            },
          )
        ],
      ),
    );
  }
}
