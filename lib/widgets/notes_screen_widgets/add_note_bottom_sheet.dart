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
    this.noteEdit,
  });

  final NoteModel? noteEdit;

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
                child: NoteAddForm(noteEdit: noteEdit, cubitContext: context),
              ),
          );
        },
      ),


    );
  }
}


class NoteAddForm extends StatefulWidget {
  const NoteAddForm({
    super.key,
    required this.cubitContext,
    this.noteEdit,
  });

  final BuildContext cubitContext;
  final NoteModel? noteEdit;

  static final GlobalKey<FormState> formKey = GlobalKey();
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController contentController = TextEditingController();
  static final GlobalKey<FormFieldState> inputKeyTitle = GlobalKey();
  static final GlobalKey<FormFieldState> inputKeyContent = GlobalKey();

  @override
  State<NoteAddForm> createState() => _NoteAddFormState();
}

class _NoteAddFormState extends State<NoteAddForm> {

  @override
  void initState() {
    super.initState();
    if(widget.noteEdit != null){
      NoteAddForm.titleController.text = widget.noteEdit!.title;
      NoteAddForm.contentController.text = widget.noteEdit!.subTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: NoteAddForm.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            inputKey: NoteAddForm.inputKeyTitle,
            hintText: 'Note title',
            controller: NoteAddForm.titleController,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            inputKey: NoteAddForm.inputKeyContent,
            hintText: 'Note content',
            controller: NoteAddForm.contentController,
            textInputAction: TextInputAction.done,
            maxLines: 5,
          ),
          const SizedBox(height: 20,),
          buildSelectNoteColor(),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            label: widget.noteEdit !=null ? 'Update' : 'Add',
            onTab: () async {
              if(widget.noteEdit == null){
                await submitAddNote();
              }else{
                submitEditNote(context);
              }
            },
          )
        ],
      ),
    );
  }

  Widget buildSelectNoteColor() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: NoteCubit.noteColors.map((e) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: (){
              setState(() {
                NoteCubit.noteColorDefault = e;
              });
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: e,
              child: e == NoteCubit.noteColorDefault
                  ? const Icon(
                      Icons.done,
                      size: 20,
                    )
                  : Container(),
            ),
          ),
        ),).toList(),
      ),
    );
  }

  void submitEditNote(BuildContext context) {
    if (NoteAddForm.formKey.currentState!.validate()) {
      widget.noteEdit!.title = NoteAddForm.titleController.text;
      widget.noteEdit!.subTitle = NoteAddForm.contentController.text;
      widget.noteEdit!.color = NoteCubit.noteColorDefault.value;
      widget.noteEdit!.save();
      NoteCubit.get(context).readNotes();
      Get.back();
    } else {

    }
  }

  Future<void> submitAddNote() async {
    if (NoteAddForm.formKey.currentState!.validate()) {
      NoteModel note = NoteModel(
        title: NoteAddForm.titleController.text,
        subTitle: NoteAddForm.contentController.text,
        date: DateFormat.yMd().format(DateTime.now()),
        color: NoteCubit.noteColorDefault.value,
      );
      await NoteCubit.get(widget.cubitContext).createNote(note);
      NoteCubit.listNotesScrollController.animateTo(
        // 0.0,
        NoteCubit.listNotesScrollController.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn
      );
    } else {

    }
  }
}
