import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
Widget DrugItem(String name, String imageUrl, String description){
  return Container(

      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: bleu, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: bleuTresTresClair,
          boxShadow: [
            BoxShadow(color: bleu.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 4,),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 23,
                        color:bleu,
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        description,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Image.network(
              imageUrl,
              width: 65,                    height: 90,

              fit: BoxFit.cover, // Adjust the fit based on your requirements
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.medical_services_outlined, // Show an error icon if the image fails to load
                  size: 57,
                  color: bleuClair, // Customize the error icon color
                );
              },
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            SizedBox(width: 5,),
          ],
        ),
      ));
}