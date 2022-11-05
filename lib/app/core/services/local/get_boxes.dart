import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/models/favorite/favorite_model.dart';
import 'package:hive/hive.dart';
import 'hive_keys.dart';

class Boxes {
  static Box<FavoriteModel> getFavorites() =>
      Hive.box<FavoriteModel>(HiveKey.favoriteBox);

  static Box<CartModel> getCart() => Hive.box<CartModel>(HiveKey.cartBox);
}
