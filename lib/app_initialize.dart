part of 'main.dart';

Future _preInitializations() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  _buildAppPages();
  await Hive.initFlutter();
  _registerBoxes();
  await _openBoxes();
}

void _registerBoxes() {
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
}

Future _openBoxes() async {
  await Hive.openBox<CartModel>(HiveKey.cartBox);
  await Hive.openBox<FavoriteModel>(HiveKey.favoriteBox);
}

void _buildAppPages() {
  AppPages.appRoutes.addAll(HomeModule.homePages);
}
