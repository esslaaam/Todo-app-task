import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/constants.dart';
import 'features/notes/controllers/notes_cubit/notes_cubit.dart';
import 'features/notes/models/note_model.dart';
import 'features/notes/views/notes_view.dart';

/// flutter packages pub run build_runner build ===> TO GENERATE TYPE ADAPTER

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => BlocProvider(
        create: (context) => NotesCubit()..fetchAllNotes(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: kPoppins),
          home: child,
        ),
      ),
      child: const NotesView(),
    );
  }
}
