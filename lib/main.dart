import 'package:flutter/material.dart';
import 'package:flutter_first/pages/home.dart';
import 'package:flutter_first/utils/routes.dart';
import 'package:flutter_first/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightThemes(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoutes.login,
      routes: {
        MyRoutes.root: (context) => const Login(),
        MyRoutes.login: (context) => const Login(),
        MyRoutes.home: (context) => const Home(),
      },
    );
  }
}
