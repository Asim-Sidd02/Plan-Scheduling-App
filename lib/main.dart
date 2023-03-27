import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:plan_and_reminder/models/reminder_model.dart';
import 'package:plan_and_reminder/pages/home_page.dart';
import 'package:plan_and_reminder/providers/reminder_provider.dart';
import 'package:plan_and_reminder/utils/color_scheme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  await Hive.openBox<Reminder>('reminders');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Reminder',
        theme: ThemeData(

          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),


        home: HomePage(),
      ),
    );
  }
}
