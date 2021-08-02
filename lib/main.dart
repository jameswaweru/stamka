import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stamka/screens/home.dart';
import 'package:stamka/screens/launch_screen.dart';
import 'package:stamka/screens/sign_up.dart';
import 'package:stamka/utils/SharedPrefManager.dart';

import 'constants.dart';

// void main() {
//   await SharedPrefManager.init();
//   runApp(MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SharedPrefManager.init();
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

