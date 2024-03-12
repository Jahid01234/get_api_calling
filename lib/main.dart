import 'package:flutter/material.dart';
import 'package:get_api_calling/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

void main() {

  runApp(MultiProvider(providers:
  [
    ChangeNotifierProvider(create: (_)=>UserProvider())
  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

