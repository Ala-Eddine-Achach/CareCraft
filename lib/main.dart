import 'dart:io';

import 'package:carecraft/core/services/favouritedrugprov.dart';
import 'package:carecraft/core/services/navifgationprov.dart';
import 'package:carecraft/ui/screens/doctorinfo.dart';
import 'package:carecraft/ui/screens/drugdetails.dart';
import 'package:carecraft/ui/screens/drugslist.dart';
import 'package:carecraft/ui/screens/login.dart';
import 'package:carecraft/ui/screens/main.dart';
import 'package:carecraft/ui/screens/signup.dart';
import 'package:carecraft/ui/screens/splash.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//local notification
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'core/services/notifserv.dart';
import 'core/services/notifservice.dart';
import 'core/services/tipservice.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  await notificationService.init();
  if (Platform.isIOS) {
    await notificationService.requestIOSPermissions();
  } else {
    await notificationService.requestAndroidPermission();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp());}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TipsProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        //HiveDataProvider
        ChangeNotifierProvider(create: (context) => HiveDataProvider()),
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: theme,
          routes: {
            '/': (context) => const Splash(),
            '/home': (context) => const Main(),
            '/Drug': (context) => const DrugsList(),
            '/drugDetails': (context) =>  DrugDetails(),
            '/doctorinfo':(context)=>DoctorInfo(),
            '/signup':(context) => SignUp(),
            '/login':(context) => LogIn(),
          }),
    );
  }
}


