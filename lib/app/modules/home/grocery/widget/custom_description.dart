import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription(
      {required this.description,
      required this.existSeeAll,
      this.length,
      Key? key})
      : super(key: key);

  final String description;
  final bool existSeeAll;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: existSeeAll,
          child: Text(
            'See All ($length)',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: ConstColors.greyColor),
          ),
        )
      ],
    );
  }
}
