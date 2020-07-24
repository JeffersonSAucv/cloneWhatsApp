import 'package:flutter/material.dart';
import 'package:whatsappclone/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xff232D36)),
          scaffoldBackgroundColor: Color(0xff101D25),
          iconTheme: IconThemeData(color: Colors.white),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff00BFA5),
          )),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
