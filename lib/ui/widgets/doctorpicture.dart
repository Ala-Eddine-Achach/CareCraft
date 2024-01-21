import 'package:flutter/material.dart';

import '../theme.dart';

class DoctorPicture extends StatelessWidget {
  const DoctorPicture({super.key, required this.imPath});

  final String imPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery
          .of(context)
          .size
          .height * 0.12,
      left: MediaQuery
          .of(context)
          .size
          .width * 0.2,
      child: ClipRRect(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: bleuTresClair,
                  border: Border.all(color: Colors.white, width: 3,)
              ),
              width: 200,
              height: 150,
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
