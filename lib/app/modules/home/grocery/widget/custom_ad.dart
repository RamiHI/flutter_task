import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomAd extends StatelessWidget {
  const CustomAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ConstColors.cardColor),
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mega',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: ConstColors.redColor),
                ),
                RichText(
                  text: TextSpan(
                      text: 'WHOP',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(
                          color: ConstColors.blueColor,
                          fontSize: 31),
                      children: [
                        TextSpan(
                          text: 'P',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                              color: ConstColors.blueColor,
                              letterSpacing: -4,
                              fontSize: 31),
                        ),
                        TextSpan(
                          text: 'E',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                              color: ConstColors.redTextColor,
                              fontSize: 31),
                        ),
                        TextSpan(
                          text: 'R',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                              color: ConstColors.blueColor,
                              fontSize: 31),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('\$ 17',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                            fontSize: 18,
                            color: ConstColors.buttonColor)),
                    const SizedBox(width: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text('\$ 32',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                fontSize: 18,
                                color: ConstColors
                                    .backgroundColor)),
                        Container(
                          height: 1,
                          width: 50,
                          color: ConstColors.backgroundColor,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '* Available until 24 December 2020',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                      fontSize: 9,
                      color: ConstColors.backgroundColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
