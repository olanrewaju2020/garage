
import 'package:get_it/get_it.dart';

import 'Models/user.dart';
import 'Models/vehicle.dart';

GetIt locator = GetIt.instance;
final app = locator.get<App>();

void resetSetupLocator() async {
  await locator.reset();
}

void setupLocator() {
  locator.registerLazySingleton(() => App());
}

class App {
  User? user;
  List<Vehicle> vehicles = [];
  List<Vehicle> vehiclesOwn = [];
}