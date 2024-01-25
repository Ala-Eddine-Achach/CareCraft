import 'package:carecraft/core/models/doctormodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
class GridElement extends StatelessWidget {
  GridElement({required this.doc});

  final Doctor doc;

  @override
  Widget build(BuildContext context) {
    // Define the dimensions of the widget
    Icon red=Icon(Icons.do_not_disturb_on_total_silence,color: Colors.red,);
    Icon green=Icon(Icons.do_not_disturb_on_total_silence,color: Colors.greenAccent,);
    double width = MediaQuery.of(context).size.width * 0.4;
    double height = MediaQuery.of(context).size.height * 0.35;

    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: width,
                          height: height * 0.53,
                          color: Colors.blue[100],
                          child: Image.asset(
                            doc.image,
                            height: height * 0.53,
                            width: width,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        'Dr. ${doc.name}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            doc.function,
                            style: TextStyle(fontSize: 20, color: CupertinoColors.systemGrey2),
                          ),
                          (doc.available) ? green : red,
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/doctorinfo', arguments: doc);
                      },
                      child: Text('Contact Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bleu,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
