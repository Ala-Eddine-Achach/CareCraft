import 'package:carecraft/core/Data/assetspaths.dart';
import 'package:carecraft/core/models/doctormodel.dart';
import 'package:flutter/material.dart';

import '../widgets/grid_element.dart';

class DoctorsSec extends StatefulWidget {
  const DoctorsSec({super.key});

  @override
  State<DoctorsSec> createState() => _DoctorsSecState();
}

class _DoctorsSecState extends State<DoctorsSec> {
  List docList = [
    Doctor(image: d4, name: 'Jalel lkadri', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'chantal', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'hahah', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'monica', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'hihi', function: 'Psy', available: true, phoneNumber: '98564138', description: s),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Ask Our Doctors For Help',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.2)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    size: 30,
                    color: Colors.black.withOpacity(.5),
                  ),
                  hintText: "   Search",
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: docList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.6),
              itemBuilder: (context, index) {
                return GridElement(doc: docList[index],);
              },
            ),
          )
        ],
      ),
    );
  }
}
