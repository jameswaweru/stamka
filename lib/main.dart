import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stamka/screens/home.dart';
import 'package:stamka/screens/launch_screen.dart';
import 'package:stamka/screens/sign_up.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travels App',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          textTheme:
          GoogleFonts.poppinsTextTheme().apply(displayColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LaunchApp()
    );
  }
}

