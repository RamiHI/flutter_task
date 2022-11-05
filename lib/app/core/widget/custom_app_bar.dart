import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_shape_card.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title, this.address}) : super(key: key);
  final String? title;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstColors.backgroundColor,
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: ConstColors.backgroundColor,
      title: title == null
          ? null
          : Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 20, color: ConstColors.blackColor),
            ),
      actions: [
        Visibility(
          visible: address != null,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CustomShapeCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined,
                    color: ConstColors.backgroundColor, size: 20),
                const SizedBox(width: 5),
                Text(
                  address!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: ConstColors.backgroundColor),
                ),
              ],
            )),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ConstColors.greyColor,
                )),
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
