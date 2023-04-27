import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_app/cubit/note_cubit.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/widgets/custom_button.dart';
import 'package:flutter_note_app/widgets/custom_input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
    this.isEdit = false,
  });

  final bool isEdit;




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 32,
        left: 24,
        right: 24,
      ),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (BuildContext context, NoteState state){
          if(state is CreateNoteFailure || state is UpdateNoteFailure){

          }

          if(state is CreateNoteSuccess || state is UpdateNoteSuccess){
            Get.back();
          }
        },
        builder: (BuildContext context, NoteState state){
          return ModalProgressHUD(
              inAsyncCall: (state is CreateNoteLoading || state is UpdateNoteLoading)? true : false,
              child: SingleChildScrollView(
                child: NoteAddForm(isEdit: false, cubitContext: context),
              ),
          );
        },
      ),


    );
  }
}


class NoteAddForm extends StatelessWidget {
  const NoteAddForm({
    super.key,
    required this.cubitContext,
    this.isEdit = false,
  });

  final BuildContext cubitContext;
  final bool isEdit;

  static final GlobalKey<FormState> formKey = GlobalKey();
  static final TextEditingController _titleController = TextEditingController();
  static final TextEditingController _contentController = TextEditingController();
  static final GlobalKey<FormFieldState> inputKeyTitle = GlobalKey();
  static final GlobalKey<FormFieldState> inputKeyContent = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            onTab: () async {
              if (formKey.currentState!.validate()) {
                NoteModel note = NoteModel(
                  title: _titleController.text,
                  subTitle: _contentController.text,
                  date: DateFormat.yMd().format(DateTime.now()),
                  color: Colors.blue.value,
                );
                await NoteCubit.get(cubitContext).createNote(note);
                NoteCubit.listNotesScrollController.animateTo(
                  NoteCubit.listNotesScrollController.position.maxScrollExtent + 200,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn
                );
              } else {

              }
            },
          )
        ],
      ),
    );
  }
}
