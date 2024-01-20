import 'package:carecraft/ui/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:carecraft/ui/theme.dart';
Widget category(BuildContext context,String asset, String txt, double padding) {
  return Column(
    children: [
      InkWell(
        onTap: () {
         Navigator.pushNamed(context, '/$txt');
        },
        child: Card(
          shadowColor: bleu,
          surfaceTintColor: bleu,
          elevation: 10,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(padding),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: bleuTresTresClair,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image(
                image: AssetImage(asset),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextWidget(
        txt,
        16,
        Colors.black,
        FontWeight.bold,
        letterSpace: 1,
      ),
    ],
  );
}
