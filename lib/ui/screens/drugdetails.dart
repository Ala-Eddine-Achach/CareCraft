import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/medicamentmodel.dart';
import '../../core/services/favouritedrugprov.dart';



class DrugDetails extends StatefulWidget {


  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  @override
  void initState() {
    //call notifyListeners()

    super.initState();
  }
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
      body: Consumer<HiveDataProvider>(
        builder: (BuildContext context, HiveDataProvider value, Widget? child) {
        return SafeArea(
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

                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: bleu.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Text(
                            medication.briefDescription,
                            textAlign: TextAlign.center,
                            style: const TextStyle(

                                fontSize: 18,
                                color: Colors.black,


                            ),
                          ),
                          SizedBox(height: 10,),
                          (value.hasId(medication.id))?GestureDetector(


                              onLongPress: () async {
                                print("object");
                                var time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                value.addReminder(medication.id, time!);


                              },

                              child:Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: bleuClair,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                    ]),
                                //width 70% of the screen

                                child: Text(
                                  value.getNameById(medication.id)?.format(context)??'Add reminder',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: bleuTresTresClair,
                                  ),
                                ),
                              )
                          ):SizedBox(height: 0,),
                          SizedBox(height: 10,),
                          Text(
                            "Dosage per day",
                            textAlign: TextAlign.center,
                            style: const TextStyle(

                                fontSize: 25,
                                color: bleu,
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

                        ]+_screens("How it works", medication.howUse)+
                          _screens("what it is used for ?", medication.whatUseFor)+
                          _screens("How to use it ?", medication.howUse)+
                          _screens("have you ever had any side effects ?", medication.sideEffects)
                          +<Widget>[SizedBox(height: 40,),],
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
                  child: GestureDetector(
                    onTap: () {

                     if(!value.hasId(medication.id)){print("dcdcdc");

                       value.addMedication(medication.id);}
                     else {
                       value.removeMedication(medication.id);}
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Icon(
                          Icons.favorite_sharp,
                          color: (value.hasId(medication.id))?Colors.red:Colors.white,
                          size: (value.hasId(medication.id))?34:30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        );}
      ),
    );

  }
  List<Widget> _screens (String str1,String str2) => [
    SizedBox(height: 10,),
    Text(
      str1,
      textAlign: TextAlign.center,
      style: const TextStyle(

          fontSize: 25,
          color: bleu,
          fontWeight: FontWeight.bold

      ),),
    SizedBox(height: 10,),
    Text(
        str2,
      textAlign: TextAlign.justify,
      style: const TextStyle(

        fontSize: 16,
        color: Colors.black,


      ),)
  ];
}