import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/modules/home/cart/cart_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';

import 'cart_controller_test.mocks.dart';

@GenerateMocks([CartController])
void main() {
  late CartController cartController;

  setUp(() async {
    cartController = MockCartController();
  });

  tearDown(() {
    Get.delete<CartController>();
  });

  group('Add or mines quantity', () {
    test('Add quantity', () {
      cartController.addQuantityItem(
          CartModel(id: 1, price: '12', count: 1, name: 'Salmon'));
    });

    test('mines quantity', () {
      cartController.addQuantityItem(
          CartModel(id: 1, price: '12', count: 1, name: 'Salmon'));
    });
  });
}
