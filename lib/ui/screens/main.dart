import 'package:carecraft/core/viewmodels/navifgationprov.dart';
import 'package:carecraft/ui/screens/profile.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/textwidget.dart';
import 'doctorsscreen.dart';
import 'home.dart';
import 'mymedications.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _screens = [
      Home(),
      DoctorsSec(),
      MyMedications(),
      Profile(),
    ];
    return Scaffold(
      backgroundColor: bleuTresTresClair,
      //app bar containing text hello user
      //and icon of notification
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextWidget(
          "Hello, Ala Edddine",
          20,
          Colors.black,
          FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.notifications,
              color: bleuTresClair,
            ),
          ),
        ],
      ),


      body: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          return IndexedStack(
            index: navigationProvider.currentIndex,
            children: _screens,
          );
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (BuildContext context, NavigationProvider value,
            Widget? child) {
          return CurvedNavigationBar(
            backgroundColor: bleuTresTresClair,
            items: [
              Icon(Icons.home_filled,
                color: (value.currentIndex == 0) ? bleu : bleuTresClair,
                size: 30,),
              Icon(Icons.calendar_month_rounded,
                color: (value.currentIndex == 1) ? bleu : bleuTresClair,
                size: 30,),
              Icon(Icons.whatshot_outlined,
                color: (value.currentIndex == 2) ? bleu : bleuTresClair,
                size: 30,),
              Icon(Icons.account_circle_outlined,
                color: (value.currentIndex == 3) ? bleu : bleuTresClair,
                size: 30,),
            ],
            onTap: (index) {
              value.updateIndex(index);
            },
            index: value.currentIndex,
            height: 50,
            animationCurve: Curves.easeInOut,

          );
        },
      ),
    );
  }

}
