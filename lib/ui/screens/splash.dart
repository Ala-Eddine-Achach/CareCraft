import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:

      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [bleuTresTresClair,
                  bleuTresClair,
                  bleuClair,
                  bleu,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight

            )
        ),
        child:  Center(
          child:Stack(
            alignment: Alignment.center, // Align items at the top center
            children: [
              Positioned(
               //to has 20% of the screen height
                top:   0,
                child: Image.asset(
                  'assets/carecraft.png',
                  height:MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.height * 0.9,
                )
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.41,
                left: MediaQuery.of(context).size.width * 0.45,// Adjust the top position as needed
                child: Image.asset(
                  'assets/androidinsat.png',
                  height:MediaQuery.of(context).size.width * 0.23,
                  width: MediaQuery.of(context).size.height * 0.23,
                ),),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45, // Adjust the top position as needed
                child: Image.asset(
                  'assets/splash.png',
                  height:MediaQuery.of(context).size.width * 1.1,
                  width: MediaQuery.of(context).size.height * 1.1,
                ),
              ),

            ],
          )
        ),
      ),);

  }
}
