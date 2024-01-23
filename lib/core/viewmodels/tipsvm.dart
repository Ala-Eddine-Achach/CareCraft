
import 'package:carecraft/core/models/tipmodel.dart';

import '../Data/Tips.dart';

class TipsViewModel  {
  late List<TipModel> _tipsService ;
  TipsViewModel() {
    _tipsService= Tips.map((tip) {
      return TipModel(
        description: tip['tip']!,
        image: tip['image']!,
      );
    }).toList();
  }

  TipModel getTip(int index) {
    return _tipsService.elementAt(index);
  }



}
