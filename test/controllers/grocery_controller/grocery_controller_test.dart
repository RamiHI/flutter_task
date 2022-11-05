import 'package:flutter_task/app/core/models/deals_model.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';

import 'grocery_controller_test.mocks.dart';

@GenerateMocks([GroceryController])
void main() {
  late GroceryController groceryController;

  setUp(() async {
    groceryController = MockGroceryController();
  });

  tearDown(() {
    Get.delete<GroceryController>();
  });

  group('Add or remove favorites', () {
    test('Add to favorites and there is a previous item', () {
      groceryController.addOrRemoveToFavorites(
          DealsModel(
              price: '12',
              date: '15 minutes',
              pieces: 15,
              dealName: 'Salmon',
              id: 1),
          true);
    });

    test('Add to favorites and there is no previous item', () {
      groceryController.addOrRemoveToFavorites(
          DealsModel(
              price: '12',
              date: '15 minutes',
              pieces: 15,
              dealName: 'Salmon',
              id: 1),
          false);
    });
  });

  group('Add or remove cart', () {
    test('Add to cart and there is a previous item', () {
      groceryController.addOrRemoveToCart(
          DealsModel(
              price: '12',
              date: '15 minutes',
              pieces: 15,
              dealName: 'Salmon',
              id: 1),
          true);
    });

    test('Add to cart and there is no previous item', () {
      groceryController.addOrRemoveToCart(
          DealsModel(
              price: '12',
              date: '15 minutes',
              pieces: 15,
              dealName: 'Salmon',
              id: 1),
          false);
    });
  });
}
