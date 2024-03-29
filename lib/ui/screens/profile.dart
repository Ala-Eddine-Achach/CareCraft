import 'package:carecraft/ui/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../core/Data/assetspaths.dart';
import '../widgets/ProfileMenuWidget.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    final double _width=MediaQuery.of(context).size.width;
    final double _height=MediaQuery.of(context).size.height;

    //a container with a text widget
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: _height*0.05),
              child: CircleAvatar(
                radius: _width*0.18,
                //image .network
                backgroundImage: AssetImage("assets/img.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text('Jalel lkadri',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          ),
          Text('Jalel_4-4-2@gmail.com',style: TextStyle(
            color: Colors.grey.shade700
          ),),
          SizedBox(height: _height*0.015,),
          SizedBox(
            width: _width*0.45,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bleu),
              ),
              child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: _height*0.01,),
          ProfileMenuWidget(icon: LineAwesomeIcons.cog,title: "Settings",onPress: (){},end: false),
          ProfileMenuWidget(icon: LineAwesomeIcons.user_check,title: "User Management",onPress: (){},end: false),
          ProfileMenuWidget(icon: LineAwesomeIcons.info,title: "Settings",onPress: (){},end: false),
          ProfileMenuWidget(icon: LineAwesomeIcons.alternate_sign_out,title: "Sign Out",onPress: (){
            try{
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/login');}
                on FirebaseAuthException catch(e){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error has occured')));

                }
          },end: true,option:Colors.red),
        ],
      ),

    );
  }
}
