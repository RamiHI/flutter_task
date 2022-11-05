part of '../home_module.dart';

class _HomePages {
  _HomePages._();

  static List<GetPage> homePages = [
    GetPage(
        name: HomeRoutes.mainRoute,
        page: () => const MainHomeView(),
        binding: MainHomeBindings()),
    GetPage(
        name: HomeRoutes.groceryRoute,
        page: () => const GroceryView(),
        binding: GroceryBindings()),
    GetPage(
        name: HomeRoutes.newsRoute,
        page: () => const NewsView(),
        binding: NewsBindings()),
    GetPage(
        name: HomeRoutes.favoritesRoute,
        page: () => const FavoritesView(),
        binding: FavoritesBindings()),
    GetPage(
        name: HomeRoutes.cartRoute,
        page: () => const CartView(),
        binding: CartBindings()),
  ];
}
