import 'package:flutter/material.dart';

import '../../../../Utilites/colors.dart';
class MyTitle extends StatelessWidget {
  const MyTitle({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.style,

  }) : super (key: key);
  final String title;
  final double fontSize;
  final  style;
  @override
  Widget build(BuildContext context) {
    return Text(title,style:TextStyle(color: ToolsUtilites.primarycolor,fontSize:fontSize,));
  }
}
