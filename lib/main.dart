import 'package:flutter/material.dart';
import 'package:news_api/counter_page.dart';
import 'package:news_api/counter_provider.dart';
import 'package:news_api/main_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
      ),
      ChangeNotifierProvider(create: (_) => CounterProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
      //HomePage(),
    );
  }
}
