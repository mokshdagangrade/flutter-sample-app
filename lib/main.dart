import 'package:dyte_flutter_sample_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DyteSampleApp());
}

class DyteSampleApp extends StatelessWidget {
  const DyteSampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dyte Sample App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff2160fd),
              primary: const Color(0xfff5f5f7),
            ),
          ),
          scaffoldBackgroundColor: const Color(0xff060617)),
      home: const DyteSampleHomePage(title: 'Dyte Sample App'),
      debugShowCheckedModeBanner: false,
    );
  }
}
