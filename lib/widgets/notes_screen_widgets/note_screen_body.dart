import 'package:flutter/cupertino.dart';
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
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const NoteItem();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
    );
  }
}