import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_app/cubit/note_cubit.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/note_item.dart';

class NotesScreenBody extends StatelessWidget {
  const NotesScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: NotesListView(),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (BuildContext context, NoteState state){
        return buildListNoteFutureBuilder(context, state);
      },
    );
  }

  Widget buildListNoteFutureBuilder(BuildContext context, NoteState state) {
    List<NoteModel> notes = (state is ReadNoteSuccess)? state.notes : [];

    return ListView.separated(
      controller: NoteCubit.listNotesScrollController,
      reverse: true,
      itemCount: notes.length ,
      itemBuilder: (context, index) {
        return NoteItem(note: notes[index],);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
    );
  }
}