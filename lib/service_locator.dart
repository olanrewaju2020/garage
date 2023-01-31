
import 'package:get_it/get_it.dart';

import 'Models/service.dart';
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
  User user = User();
  String? serviceType;
  List<Vehicle> vehicles = [];
  List<Vehicle> vehiclesOwn = [];
  List<GService> servicesByOwner = [];
  List<GService> servicesByCar = [];
  List<User> serviceVendors = [];
  User? vendor = User();
  Vehicle vehicleSelected = Vehicle();

}