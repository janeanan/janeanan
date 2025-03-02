import 'package:flutter/material.dart';
import 'package:janeanan/domain/list_laptop_view_model.dart';
import 'package:janeanan/domain/list_user_view_model.dart';
import 'package:janeanan/pages/e_com_page.dart';
import 'package:janeanan/pages/home_page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => UserListModel()),
      ChangeNotifierProvider(create: (ctx) => LaptopListModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        home: const EComPage(),
      ),
    );
  }
}
