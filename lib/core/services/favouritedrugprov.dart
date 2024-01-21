import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDataProvider extends ChangeNotifier {
  Box _box = Hive.box<TimeOfDay>('drug');
  addReminder(int id, TimeOfDay name) {
    _box.put(id, name);
    notifyListeners();
  }
  removeMedication(int id) {
    _box.delete(id);
    notifyListeners();
  }
  addMedication(int id)
  {//10:10
    _box.put(id,TimeOfDay(hour: 10, minute: 10) );
    notifyListeners();
  }
  List<int> getAllIds() {
    return _box.keys.cast<int>().toList();
  }

  TimeOfDay? getNameById(int id) {
    // Replace 'name' with the key you used to store the name in the box
    return _box.get(id);
  }

  bool hasId(int id) {
    return _box.containsKey(id);
  }

}
