import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/modules/home/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class CustomCartCard extends GetView<CartController> {
  const CustomCartCard({required this.cartModel, Key? key}) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
              color: Color(int.parse(cartModel.color ?? '')),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartModel.name ?? '',
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$ ${(int.parse(cartModel.price!) * cartModel.count!)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: ConstColors.buttonColor),
              )
            ],
          ),
        ),
        const SizedBox(width: 5),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: ConstColors.blueButtonColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () => controller.minusQuantityItem(cartModel),
                  icon: Icon(
                    Icons.remove,
                    color: ConstColors.blueButtonColor,
                    size: 15,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('${cartModel.count ?? 0}'),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: ConstColors.blueButtonColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () => controller.addQuantityItem(cartModel),
                  icon: Icon(
                    Icons.add,
                    color: ConstColors.blueButtonColor,
                    size: 15,
                  )),
            ),
          ],
        )
      ],
    );
  }
}
