import 'package:carecraft/core/Data/assetspaths.dart';
import 'package:carecraft/core/models/doctormodel.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/grid_element.dart';

class DoctorsSec extends StatefulWidget {
  const DoctorsSec({super.key});

  @override
  State<DoctorsSec> createState() => _DoctorsSecState();
}

class _DoctorsSecState extends State<DoctorsSec> {
  List docList = [
    Doctor(image: d4, name: 'Mondher lakbayer', function: 'cardio', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Wadii Jari ', function: 'vete', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'Labyedh Slimen', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'laswed', function: 'Psy', available: true, phoneNumber: '98564138', description: s),
    Doctor(image: d4, name: 'samiron', function: 'Psy', available: true, phoneNumber: '98564138', description: s),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              'Ask Our Doctors For Help',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child:SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView(); // Open the search view
                  },
                  onChanged: (_) {
                    // Handle search text changes here
                    // You can perform search operations or update the UI based on the search text
                    // For example, you can update a list of suggestions based on the search text
                    // and pass the updated suggestions to the suggestionsBuilder
                  },
                  leading: const Icon(Icons.search),
                  hintText: 'Search for doctor',
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                // Get the current search query
                final String query = controller.value.text.toLowerCase();

                // Filter the docList based on the search query
                final List<dynamic> filteredSuggestions = docList
                    .where((item) => item.name.toLowerCase().contains(query))
                    .toList();
                //use list.generate
                return List.generate(filteredSuggestions.length, (index) =>
                ListTile(
                  onTap: () {
                    setState(() {
                      controller.value = TextEditingValue(text: filteredSuggestions[index].name);
                      //push to screen

                    });
                    controller.closeView("");
                    Navigator.pushNamed(context, '/doctorinfo',arguments: filteredSuggestions[index]);
                        // Close the search view
                    // Navigate to the details page of the tapped doc
                  },
                  leading: CircleAvatar(
                      backgroundColor: bleuTresClair,
                      child: Icon(Icons.person,color: bleu,)
                  ),
                  title: Text(filteredSuggestions[index].name),
                  subtitle: Text(filteredSuggestions[index].function),
                )
                );
              },
            )

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
