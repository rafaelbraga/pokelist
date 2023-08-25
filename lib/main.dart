import 'package:flutter/material.dart';
import 'package:poke_list/features/login/presentation/page/login_home_page.dart';
import 'package:poke_list/features/login/presentation/state/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromRGBO(244, 97, 77, 1),
          secondaryHeaderColor: const Color.fromRGBO(11, 104, 178, 1),
        ),
        home: const LoginHomePage());
  }
}
