import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carecraft/core/models/tipmodel.dart';
import '../Data/Tips.dart';

class TipsProvider extends ChangeNotifier {
  late List<TipModel> _tips;
  late TipModel _currentTip;

  TipsProvider() {
    _tips = Tips.map((tip) {
      return TipModel(
        description: tip['tip']!,
        image: tip['image']!,
      );
    }).toList();
    getRandomTip();
  }

   getRandomTip() {
    final random = Random();
    _currentTip=_tips[random.nextInt(_tips.length)];
    notifyListeners();
  }
  TipModel get currentTip => _currentTip;
}
