import 'package:carecraft/ui/theme.dart';
import 'package:carecraft/ui/widgets/Drugitem.dart';
import 'package:flutter/material.dart';
class DrugsList extends StatefulWidget {
  const DrugsList({super.key});

  @override
  State<DrugsList> createState() => _DrugsListState();
}

class _DrugsListState extends State<DrugsList> {
  ScrollController controller = ScrollController();
  double topContainer = 0;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        topContainer = (controller.offset /140);
      });
    });
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bleuTresClair,
      appBar: AppBar(
        backgroundColor: bleuTresClair,
        title: Center(
          child: Text('Drugs      '
          ,style: TextStyle(color: bleu,fontSize: 30,fontWeight: FontWeight.w500,fontFamily: 'Poppins'
        ))),
        leading: IconButton(color: bleu,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 20,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          double scale = 1;

          scale = index + 1 - topContainer;
          if (scale < 0) {
            scale = 0;
          } else if (scale > 1) {
            scale = 1;
          }
      
      
          return Transform(
              transform: Matrix4.identity()..scale(scale, scale),
              alignment: Alignment.bottomCenter,
              child: Align(
                  alignment: Alignment.topRight,
                  heightFactor: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/drugDetails');
                    },
                      child: DrugItem()),
                  ));
        },
      ),
    );
  }
}
