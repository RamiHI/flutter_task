import 'package:flutter/material.dart';

class CustomShapeCard extends StatelessWidget {
  const CustomShapeCard({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 125,
      padding: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/custom_shape.png'))),
      child: child,
    );
  }
}
