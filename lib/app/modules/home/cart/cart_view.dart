import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/services/local/get_boxes.dart';
import 'package:flutter_task/app/modules/home/cart/cart_controller.dart';
import 'package:flutter_task/app/modules/home/cart/widget/custom_cart_card.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../core/widget/custom_app_bar.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        address: 'Oxford Street',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Cart',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: Boxes.getCart().listenable(),
                  builder: (context, box, _) {
                    List<CartModel> cart =
                        box.values.cast<CartModel>().toList();
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          CartModel cartModel = cart[index];
                          return CustomCartCard(cartModel: cartModel);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: cart.length);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
