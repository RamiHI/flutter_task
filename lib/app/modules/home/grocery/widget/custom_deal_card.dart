import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/models/deals_model.dart';
import 'package:flutter_task/app/core/services/local/get_boxes.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/constants/colors.dart';

class CustomDealCard extends GetView<GroceryController> {
  const CustomDealCard({required this.deal, required this.isFavorite, Key? key})
      : super(key: key);

  final DealsModel deal;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    log('isFavorite : $isFavorite');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 90,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(int.parse(deal.color!)),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              width: 27,
              height: 27,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.backgroundColor, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () =>
                      controller.addOrRemoveToFavorites(deal, isFavorite),
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 12,
                    color: isFavorite
                        ? ConstColors.primaryColor
                        : ConstColors.greyColor,
                  )),
            )
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              deal.dealName ?? '',
              overflow: TextOverflow.visible,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Pieces ${deal.pieces}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 10,
                  color: ConstColors.blackColor,
                ),
                const SizedBox(width: 5),
                Text(
                  '${deal.date} Away',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('\$ ${deal.price}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13, color: ConstColors.buttonColor)),
                const SizedBox(width: 5),
                Visibility(
                  visible: deal.oldPrice != null,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text('\$ ${deal.oldPrice}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13, color: ConstColors.blackColor)),
                      Container(
                        height: 1,
                        width: 30,
                        color: ConstColors.blackColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: Boxes.getCart().listenable(),
                builder: (context, box, _) {
                  return IconButton(
                    iconSize: 10,
                    constraints:
                        const BoxConstraints(maxHeight: 18, maxWidth: 18),
                    onPressed: () => controller.addOrRemoveToCart(
                        deal,
                        box.values
                            .cast<CartModel>()
                            .toList()
                            .any((element) => element.id == deal.id)),
                    icon: Icon(
                        box.values
                                .cast<CartModel>()
                                .toList()
                                .any((element) => element.id == deal.id)
                            ? Icons.remove_shopping_cart_outlined
                            : Icons.add_shopping_cart_outlined,
                        size: 10),
                  );
                })
          ],
        ),
      ],
    );
  }
}
