import 'package:flutter/material.dart';

import '../theme.dart';

class DoctorPicture extends StatelessWidget {
  const DoctorPicture({super.key, required this.imPath});

  final String imPath;

  @override
  Widget build(BuildContext context) {
    final double _width=MediaQuery.of(context).size.width;
    final double _height=MediaQuery.of(context).size.height;
    return Positioned(
      top: _height*0.08,
      left:_width*0.24,
      right: _width*0.24,
      child: ClipRRect(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: bleuTresClair,
                  border: Border.all(color: Colors.white, width: 3,)
              ),
              height: _height*0.18,
              child: Center(
                child: Image.asset(
                  imPath,
                  fit: BoxFit.fill,
                ),
              )),
      ),
    );
  }
}
