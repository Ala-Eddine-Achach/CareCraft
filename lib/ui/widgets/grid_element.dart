import 'package:carecraft/core/models/doctormodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GridElement extends StatelessWidget {
  GridElement({required this.doc});
  Doctor doc;

  @override
  Widget build(BuildContext context) {
    Icon red=Icon(Icons.do_not_disturb_on_total_silence,color: Colors.red,);
    Icon green=Icon(Icons.do_not_disturb_on_total_silence,color: Colors.greenAccent,);
    double width=MediaQuery.of(context).size.width*0.4;
    double height=MediaQuery.of(context).size.height*0.35;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 15,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: Container(
              color: Colors.white,
              width: width,
              height: height,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          width: width,
                          height: height*0.55,
                          color: Colors.blue[100],
                          child: Image.asset(doc.image,
                            height: 40,)),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4,top: 8,left: 8),
                        child: Text('Dr. ${doc.name}',
                          style: TextStyle(
                              fontSize: 20
                          ),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4,left: 8,bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(doc.function,
                          style: TextStyle(
                              fontSize: 20,
                              color: CupertinoColors.systemGrey2
                          ),),
                        doc.available ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: green,
                        ): Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: red,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {

                    Navigator.pushNamed(context, '/doctorinfo',arguments: doc);

                  }
                  , child: Text('Contact Now'),
                    style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        foregroundColor: Colors.white,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
