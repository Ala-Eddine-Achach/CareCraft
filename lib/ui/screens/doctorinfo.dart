import 'package:carecraft/ui/theme.dart';
import 'package:carecraft/ui/widgets/doctorpicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/doctormodel.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Doctor arguments = ModalRoute.of(context)?.settings.arguments as Doctor;
    return Scaffold(
      backgroundColor: bleuClair,
      appBar: AppBar(
        backgroundColor: bleuClair,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Doctor's Details",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        elevation: 16,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.06),
                                  child: Text(
                                    'Dr. ${arguments.name}',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    arguments.function,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FilledButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Audio',
                                        style: TextStyle(color: bleu),
                                      ),
                                      icon: Icon(
                                        Icons.call,
                                        color: bleu,
                                      ),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(5),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                    ),
                                    FilledButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Video',
                                      ),
                                      icon: Icon(Icons.video_call),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(5),
                                          backgroundColor:
                                              MaterialStatePropertyAll(bleu)),
                                    ),
                                    FilledButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Chat',
                                        style: TextStyle(color: bleu),
                                      ),
                                      icon: Icon(
                                        Icons.chat,
                                        color: bleu,
                                      ),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(5),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'About',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(arguments.description,
                                        style: TextStyle(
                                          fontSize: 16
                                        ),),
                                      )),
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Phone Number',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        '+216-${arguments.phoneNumber}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            color: bleuTresTresClair,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DoctorPicture(
                imPath: arguments.image,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
