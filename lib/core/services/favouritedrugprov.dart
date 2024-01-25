import 'dart:async';

import 'package:carecraft/core/services/notifservice.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'notifserv.dart';

class HiveDataProvider extends ChangeNotifier {
  Box _box = Hive.box<TimeOfDay>('drug');
  NotificationService notificationService = NotificationService();
  addReminder(int id, TimeOfDay name,String body) {
    _box.put(id, name);
    notifyListeners();
    //use notification service
    notificationService.scheduleNotification(id, "a new reminder is set", 'remeber to take your medication :$body', DateTime.now(), name, 'payload', 'daily',null);
    //daily notification
    /*LocalNotifications.scheduleDailyNotification(id: id,
        title: 'a new reminder is set',
        body: 'remeber to take your medication :$body',
        notificationTime: name,
        payload: 'payload');*/
  }
  removeMedication(int id) {
    _box.delete(id);
    notifyListeners();
    notificationService.cancelNotification(id);
    //remove notification
    //LocalNotifications.cancelNotification(id);
  }
  addMedication(int id,String body)
  {//10:10
    _box.put(id,TimeOfDay(hour: 10, minute: 10) );
    notifyListeners();
    LocalNotifications.showSimpleNotification(title: 'a new reminder is set', body: 'at 10:10', payload: 'payload');
    //at 10:10
    notificationService.scheduleNotification(id, "a new reminder is set", 'remeber to take your medication :$body', DateTime.now(), TimeOfDay(hour: 10, minute: 10), 'payload', 'daily',null);
    /*LocalNotifications.scheduleDailyNotification(id: id,
        title: 'a new reminder is set',
        body: 'remeber to take your medication : $body',
        notificationTime: TimeOfDay(hour: 10, minute: 10),
         payload: 'payload');*/
    print("notification sent");
  }
  List<int> getAllIds() {
    return _box.keys.cast<int>().toList();
  }

  TimeOfDay? getNameById(int id) {
    // Replace 'name' with the key you used to store the name in the box
    return _box.get(id);
  }
  int getLength() {
    return _box.length;
  }

  bool hasId(int id) {
    return _box.containsKey(id);
  }

}
