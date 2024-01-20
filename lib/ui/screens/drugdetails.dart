import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';

import '../../core/models/medicamentmodel.dart';



class DrugDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Medication medication = ModalRoute.of(context)!.settings.arguments as Medication;
    return Scaffold(
      //app bar with transparent background and back icon ios
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: bleu,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: bleuTresClair,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: Image.network(
                      medication.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.medical_services_outlined,

                          color: Colors.blue,
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
                  ),
                ),
                //sizebox with 30% of height
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height /2.3 ) ,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: bleuTresTresClair,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: bleu,
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15,top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(medication.name,
                          style: TextStyle(
                            fontSize: 25,
                            color: bleu,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          medication.briefDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                    SizedBox(height: 10,),
                    Text(
                      "Dosage per day",
                      textAlign: TextAlign.center,
                      style: const TextStyle(

                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold

                      ),),
                        SizedBox(height: 10,),
                        Text(
                          medication.dosagePerDay.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),


                          ),
                         SizedBox(height: 10,),
                        Text(
                          "How it works",
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                          SizedBox(height: 10,),
                        Text(
                          medication.howWork,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(

                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "what it is used for ?",
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          medication.whatUseFor,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(

                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "How to use it ?",
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          medication.howUse,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(

                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "have you ever had any side effects ?",
                          textAlign: TextAlign.center,
                          style: const TextStyle(

                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          medication.sideEffects,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(

                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold

                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height / 2.3) - 30,
              right: 35,
              child: Card(
                color: bleu,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 10.0,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
