import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wakke_fun/principal_manager.dart';
import 'package:wakke_fun/screens/feed-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> user = jsonDecode(jsonString);
    return MaterialApp(
        initialRoute: PrincipalManager.id,
        routes: {
          PrincipalManager.id: (context) => PrincipalManager(),
        });
  }
}
