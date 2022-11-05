import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomLocationInformation extends StatelessWidget {
  const CustomLocationInformation(
      {required this.locationType, required this.address, Key? key})
      : super(key: key);

  final String locationType;
  final String address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 167,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ConstColors.lightGrey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Row(
            children: [
              Container(
                width: 39,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ConstColors.lightGrey,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        locationType,
                        overflow: TextOverflow.visible,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 9, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
