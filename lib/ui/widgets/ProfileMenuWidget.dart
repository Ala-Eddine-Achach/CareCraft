import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.end,
    this.option
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool end;
  final MaterialColor? option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(

          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bleu,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon),
          ),
          title: Text(title,
          style: TextStyle(
            color: (option!=null)?option:Colors.black
          ),),

          trailing:!end? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                  LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey)):null
      ),
    );
  }
}