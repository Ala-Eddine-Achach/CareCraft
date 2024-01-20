import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
Widget DrugItem(){
  return Container(

      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: bleuTresTresClair,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
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
                    "Panadol",
                    style: TextStyle(
                        fontSize: 25,
                        color:bleu,
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " a popular pain reliever and fever reducer with paracetamol as its active ingredient.",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Image.network(
              "https://www.panadol.com/content/dam/cf-consumer-healthcare/panadol-reborn/en_IE/product-detail/panadol-extra-advance-box-32/Panadol-Extra-Advance-Box-32s380x463.png",
              width: 65,                    height: 90,

              fit: BoxFit.cover, // Adjust the fit based on your requirements
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.medical_services_outlined, // Show an error icon if the image fails to load
                  size: 57,
                  color: bleuTresTresClair, // Customize the error icon color
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