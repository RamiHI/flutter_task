import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/models/deals_model.dart';
import 'package:flutter_task/app/core/models/favorite/favorite_model.dart';
import 'package:flutter_task/app/core/services/local/get_boxes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../core/models/category_model.dart';
import '../../../core/models/location_information.dart';
import '../../../core/widget/bot_toast.dart';
import '../main_home/main_home_controller.dart';

class GroceryController extends GetxController {
  late List<LocationInformation> locationInformation;
  late List<CategoryModel> categories;
  late List<DealsModel> deals;
  late Box<FavoriteModel> favoriteBox;
  late Box<CartModel> cartBox;

  @override
  void onInit() {
    locationInformation = [
      LocationInformation(
          locationType: 'Home Address',
          address: 'Mustafa St. No:2\nStreet x12'),
      LocationInformation(
          locationType: 'Office Address',
          address: 'Axis Istanbul, B2 Blok\nFloor 2, Office 11'),
    ];
    categories = [
      CategoryModel(categoryName: 'Steak', color: '0xFFF9BDAD'),
      CategoryModel(categoryName: 'Vegetables', color: '0xFFFAD96D'),
      CategoryModel(categoryName: 'Beverages', color: '0xFFCCB8FF'),
      CategoryModel(categoryName: 'Fish', color: '0xFFB0EAFD'),
      CategoryModel(categoryName: 'Juice', color: '0xFFFF9DC2'),
    ];
    deals = [
      DealsModel(
          id: 0,
          dealName: 'Summer Sun Ice Cream Pack',
          pieces: 5,
          date: '15 Minutes Away',
          price: '12',
          oldPrice: '18',
          color: '0xffFBEDD8'),
      DealsModel(
          id: 1,
          dealName: 'Turkish Steak',
          pieces: 5,
          date: '15 Minutes Away',
          price: '15',
          color: '0xff28D193'),
      DealsModel(
          id: 2,
          dealName: 'Salmon',
          pieces: 5,
          date: '15 Minutes Away',
          price: '20',
          color: '0xff28D193'),
      DealsModel(
          id: 3,
          dealName: 'Red Juice',
          pieces: 5,
          date: '15 Minutes Away',
          price: '25',
          color: '0xff28D193'),
    ];
    favoriteBox = Boxes.getFavorites();
    cartBox = Boxes.getCart();
    super.onInit();
  }

  void addOrRemoveToFavorites(DealsModel dealsModel, bool isFavorite) async {
    if (isFavorite) {
      List<FavoriteModel> favorites =
          favoriteBox.values.cast<FavoriteModel>().toList();
      FavoriteModel favoriteModel =
          favorites.firstWhere((element) => element.id == dealsModel.id);
      await favoriteModel.delete();
      CustomToast.showDefault('Successfully deleted to favourites');
    } else {
      FavoriteModel favoriteModel = FavoriteModel()
        ..id = dealsModel.id
        ..color = dealsModel.color
        ..price = dealsModel.price
        ..name = dealsModel.dealName;
      await favoriteBox.add(favoriteModel);
      CustomToast.showDefault('Successfully added to favourites');
    }
  }

  void addOrRemoveToCart(DealsModel dealsModel, bool isFoundCart) async {
    if (isFoundCart) {
      List<CartModel> cart = cartBox.values.cast<CartModel>().toList();
      CartModel cartModel =
          cart.firstWhere((element) => element.id == dealsModel.id);
      await cartModel.delete();
      CustomToast.showDefault('Successfully deleted to cart');
    } else {
      CartModel cartModel = CartModel()
        ..id = dealsModel.id
        ..color = dealsModel.color
        ..price = dealsModel.price
        ..name = dealsModel.dealName
        ..count = 1;
      await cartBox.add(cartModel);
      CustomToast.showDefault('Successfully added to cart');
    }
    MainHomeController mainHomeController = Get.find<MainHomeController>();
    mainHomeController.calculateTotalPrice();
  }
}
