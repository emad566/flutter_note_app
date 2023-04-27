import 'package:flutter/material.dart';
import 'package:flutter_note_app/screens/notes_screen.dart';
import 'package:flutter_note_app/services/theme_services.dart';
import 'package:flutter_note_app/shared/constants.dart';
import 'package:flutter_note_app/shared/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(Caches.kHiveNotesBox);

  await GetStorage.init();
  runApp(
    Provider(
        create: (BuildContext context) {

        },
        child: const MyApp()
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeServices().theme;
    Get.changeThemeMode(themeMode);

    return GetMaterialApp(
      theme: Themes.lightThem,
      darkTheme: Themes.darkThem,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home:  const SafeArea(child: NotesScreen()),
    );
  }
}