import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      size: 30,
                      color: Colors.black.withOpacity(.5),
                    ),
                    hintText: "   Search",
                  ),
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
          ],
        ),
      ),
    );
  }
}
