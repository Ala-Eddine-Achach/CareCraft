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
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:

      Container(
        decoration: const BoxDecoration(

            gradient: LinearGradient(
                colors: [Colors.deepPurple,
                  Colors.pinkAccent,

                  Colors.greenAccent,
                  Colors.deepOrangeAccent,

                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight

            )
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.attach_money,size:200,color: Colors.blue,),




              SizedBox(height: 40,) ,

            ],
          ),
        ),
      ),);

  }
}
