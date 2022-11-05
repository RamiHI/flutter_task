import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/models/category_model.dart';
import 'package:flutter_task/app/core/models/deals_model.dart';
import 'package:flutter_task/app/core/models/favorite/favorite_model.dart';
import 'package:flutter_task/app/core/models/location_information.dart';
import 'package:flutter_task/app/core/services/local/get_boxes.dart';
import 'package:flutter_task/app/core/widget/custom_text_field.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_controller.dart';
import 'package:flutter_task/app/modules/home/grocery/widget/custom_ad.dart';
import 'package:flutter_task/app/modules/home/grocery/widget/custom_category_card.dart';
import 'package:flutter_task/app/modules/home/grocery/widget/custom_deal_card.dart';
import 'package:flutter_task/app/modules/home/grocery/widget/custom_description.dart';
import 'package:flutter_task/app/modules/home/grocery/widget/custom_location_information.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widget/custom_app_bar.dart';

class GroceryView extends GetView<GroceryController> {
  const GroceryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          address: 'Mustafa St.',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ConstColors.backgroundTextFormField,
                      borderRadius: BorderRadius.circular(10)),
                  child: CustomTextFormField(
                    textInputType: TextInputType.text,
                    isSide: true,
                    prefix: Icon(Icons.search, color: ConstColors.blackColor),
                    hintText: 'Search in thousands of products',
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        LocationInformation location =
                            controller.locationInformation[index];
                        return CustomLocationInformation(
                            locationType: location.locationType ?? '',
                            address: location.address ?? '');
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 5,
                        );
                      },
                      itemCount: controller.locationInformation.length),
                ),
                const SizedBox(height: 40),
                CustomDescription(
                  description: 'Explore by Category',
                  existSeeAll: true,
                  length: controller.categories.length,
                ),
                SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 15),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        CategoryModel category = controller.categories[index];
                        return CustomCategoryCard(
                            categoryName: category.categoryName ?? '',
                            color: category.color ?? '');
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: controller.categories.length),
                ),
                const SizedBox(height: 30),
                const CustomDescription(
                  description: 'Deals of the day',
                  existSeeAll: false,
                ),
                ValueListenableBuilder(
                  valueListenable: Boxes.getFavorites().listenable(),
                  builder: (context, box, _) {
                    return SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            DealsModel deal = controller.deals[index];
                            return CustomDealCard(
                              deal: deal,
                              isFavorite: box.values
                                  .cast<FavoriteModel>()
                                  .toList()
                                  .any((element) => element.id == deal.id),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          itemCount: controller.deals.length),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const CustomAd(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
