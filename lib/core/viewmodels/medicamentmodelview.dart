import '../Data/medicaments.dart';
import '../models/medicamentmodel.dart';

class MedicationModelView {
  late List<Medication> medicationsList ;

  MedicationModelView() {
    medicationsList= medications.map((medication) {
      return Medication(
        id: medication['id'],
        name: medication['name'],
        briefDescription: medication['briefDescription'],
        imageUrl: medication['imageUrl'],
        fullDescription: medication['fullDescription'],
        dosagePerDay: medication['dosagePerDay'],
      );
    }).toList();
  }
  //method returning a list of medications with a given id in list of ids
  List<Medication> getMedicationsByIds(List<int> ids) {
    return medicationsList.where((medication) => ids.contains(medication.id)).toList();
  }
}