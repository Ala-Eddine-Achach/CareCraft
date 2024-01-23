import 'package:carecraft/core/services/tipservice.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/category.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: bleuTresTresClair  ,
        padding: const EdgeInsets.only(top: 30, left: 0, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                alignment: Alignment.center,
                // Replace this with your big screen content

                child: Consumer<TipsProvider>(
                  builder: (BuildContext context, TipsProvider value, Widget? child) {
                   return Stack(
                     alignment: Alignment.center,
                     children: [
                       Container(width: double.infinity,
                         height: double.infinity,
                         child: Column(
                           children: [
                             Flexible(
                               flex: 4,
                               fit: FlexFit.tight,
                               child: Container(
                                 width: double.infinity,

                                 child: FittedBox(
                                   child: Image.network(
                                     value.currentTip.image,
                                     fit: BoxFit.cover,
                                     errorBuilder: (context, error, stackTrace) {
                                       return Icon(
                                         Icons.tips_and_updates_outlined,

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
                             ),
                             Flexible(
                               flex: 1,
                               fit: FlexFit.tight,
                               child: Container(

                               ),
                             )
                           ],
                         ),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Flexible(fit: FlexFit.tight,
                             flex: 6,
                             child: SizedBox(),
                           )
                           ,
                           Flexible(
                             fit: FlexFit.tight,
                             flex: 4,
                             child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                               width: double.infinity,
                               //rounded edges
                               decoration: BoxDecoration(
                                 color: Color.lerp(Colors.grey, bleu, .4)?.withOpacity(.95),
                                 borderRadius: BorderRadius.circular(30),
                               ),
                               //color  grey merged with bleu and have much tranparency
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround ,

                                 children: [
                                   Text("Tip of the day",

                                     style: TextStyle(
                                        fontSize: 35,
                                       fontWeight: FontWeight.bold,
                                       color: bleuTresClair,
                                     ),
                                   ),
                                   Center(
                                     child: Text(

                                       value.currentTip.description,
                                        textAlign: TextAlign.center,
                                       style: TextStyle(
                                          fontSize: 18,

                                         color: Colors.white,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                       Positioned(
                         //an icon in bottom left
                           bottom: 0,
                           right: 0,
                           child:IconButton(
                             icon: Icon(Icons.refresh, color: bleu, size: 40 ),
                             onPressed: () {
                                value.getRandomTip();
                             },
                           )
                       )
                     ],
                   );
                  },

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  category(context,"assets/capsule.png", "Drug", 5),
                  category(context,"assets/virus.png", "Virus", 10),
                  category(context,"assets/heart.png", "Physo", 10),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
