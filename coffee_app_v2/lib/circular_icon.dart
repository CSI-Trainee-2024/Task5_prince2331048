import 'package:flutter/material.dart';

Widget squareRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      squareIcon(),
      squareIcon(),
    ],
  );
}
Widget squareIcon(){
  return const Icon(
    Icons.square_rounded,
    color:Color(0xFF967259),
    size: 12.5,
  );

}