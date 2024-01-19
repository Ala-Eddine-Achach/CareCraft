import 'package:carecraft/core/viewmodels/navifgationprov.dart';
import 'package:carecraft/ui/screens/main.dart';
import 'package:carecraft/ui/screens/splash.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main()  async {

  runApp(MyApp());}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: theme,
          routes: {
            '/': (context) => const Splash(),
            '/home': (context) => const Main(),
      
          }),
    );
  }
}


