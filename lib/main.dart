import 'package:flutter/material.dart';
import 'package:fluttertodolist/pages/addtask_view.dart';
import 'package:fluttertodolist/pages/home_view.dart';
import 'package:fluttertodolist/pages/home_viewmodel.dart';
import 'package:fluttertodolist/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'notify.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotifyHelper().setup();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: TodoHomeViewModel().theme,
      home: const TodoHome(),
    );
  }
}