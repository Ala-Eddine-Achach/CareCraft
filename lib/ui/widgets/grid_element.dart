import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/doctormodel.dart';
import '../theme.dart';

class GridElement extends StatelessWidget {
  GridElement({required this.doc});

  final Doctor doc;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.4;

    return SizedBox(
      width: width,
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
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      //rounded edges
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bleuTresClair,
                      ),

                      child: SizedBox(

                        width: width,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            doc.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        'Dr. ${doc.name}',
                        overflow: TextOverflow.ellipsis,
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
                          (doc.available) ? Icon(Icons.do_not_disturb_on_total_silence, color: Colors.greenAccent) : Icon(Icons.do_not_disturb_on_total_silence, color: Colors.red),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/doctorinfo', arguments: doc);
                      },
                      child: Text('Contact Now'),
                      style: ElevatedButton.styleFrom(
                       foregroundColor:Colors.white,
                        backgroundColor:  bleu,
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
