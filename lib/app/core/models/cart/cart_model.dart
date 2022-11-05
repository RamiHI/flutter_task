import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  CartModel({this.id, this.price, this.count, this.name});

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? price;
  @HiveField(3)
  int? count;
  @HiveField(4)
  String? color;
}
