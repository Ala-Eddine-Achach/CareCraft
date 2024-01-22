import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/medicamentmodel.dart';
import '../../core/services/favouritedrugprov.dart';
import '../../core/viewmodels/medicamentmodelview.dart';
import '../widgets/Drugitem.dart';
class MyMedications extends StatefulWidget {
  const MyMedications({super.key});

  @override
  State<MyMedications> createState() => _MyMedicationsState();
}

class _MyMedicationsState extends State<MyMedications> {

  @override

  @override
  Widget build(BuildContext context) {

    return Consumer<HiveDataProvider>(
      builder:(BuildContext context, HiveDataProvider value, Widget? child)
      {List<int> ids=value.getAllIds();
      List<Medication> medicationsList=MedicationModelView().getMedicationsByIds(ids);

        return ListView.builder(
          itemCount :value.getLength(),
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/drugDetails',
                    arguments: medicationsList[index]);
              },
              child: DrugItem(medicationsList[index].name,medicationsList[index].imageUrl,medicationsList[index].briefDescription),
            );
          }
        )
        ;},
    );
  }
}
