import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/custom_button.dart';
import 'package:flutter_note_app/widgets/custom_input_field.dart';


class AddNoteBottomSheet extends StatelessWidget {

  const AddNoteBottomSheet({
    super.key,
    this.isEdit = false,
    required this.titleController,
    required this.contentController,
    required this.formKey
  });

  final TextEditingController titleController;
  final TextEditingController contentController;
  final bool isEdit;
  final GlobalKey<FormState> formKey;

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
              hintText: 'Note title',
              controller: titleController,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12,),
            CustomTextField(
              hintText: 'Note content',
              controller: contentController,
              textInputAction: TextInputAction.done,
              maxLines: 5,
            ),
            const SizedBox(height: 50,),
            CustomButton(
              label: isEdit? 'Update' : 'Add',
              onTab: (){
                if(formKey.currentState!.validate()){

                }else{

                }
              },
            )
          ],
        ),
      );
  }
}
