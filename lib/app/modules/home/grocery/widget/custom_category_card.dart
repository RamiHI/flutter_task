import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard(
      {required this.categoryName, required this.color, Key? key})
      : super(key: key);

  final String color;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
              color: Color(int.parse(color)),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(height: 5),
        Text(
          categoryName,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
