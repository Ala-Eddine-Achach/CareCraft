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
    Doctor(image: d4, name: 'Ala', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Ala', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Ala', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Ala', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Ala', function: 'Psy', available: true, phoneNumber: '98564138', description: s),

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
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded,),
                    hintText: 'Search by name or by speciality',
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
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
