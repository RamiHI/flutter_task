import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  FavoriteModel({this.id, this.price, this.color, this.name});

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? price;
  @HiveField(3)
  String? color;
}
