import 'package:cached_network_image/cached_network_image.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
Widget DrugItem(String name, String imageUrl, String description){
  return Container(

      height: 150,
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
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.medical_information_outlined,color: bleuTresTresClair,),
            ),
            SizedBox(width: 5,),
          ],
        ),
      ));
}