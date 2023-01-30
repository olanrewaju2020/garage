import 'package:jiffy/jiffy.dart';

import 'user.dart';
import 'vehicle.dart';

class GService {
  Vehicle? vehicle;
  User? serviceOwner;
  User? serviceProvider;
  String? uuid, serviceType, description, status;
  double? cost;
  String? datePosted, dateCreated;
  var rate;

  GService({this.uuid, this.serviceType, this.cost, this. rate, this.status,
      this.description, this.vehicle, this.serviceOwner, this.serviceProvider,
      this.datePosted, this.dateCreated
});

  factory GService.fromJson(Map<String, dynamic> json) => GService(
    uuid: json["uuid"],
    serviceType: json["serviceType"],
    cost: double.parse('${json["cost"] ?? "0"}'),
    rate: json["rate"],
    status: json["status"],
    description: json["description"],
    vehicle: Vehicle.fromServiceJson(json["vehicle"]),
    serviceOwner: User.fromOwnerJson(json["serviceOwner"]),
    serviceProvider: User.fromOwnerJson(json["serviceProvider"]),
    datePosted: Jiffy(json["datePosted"]).yMMMEd,
    dateCreated: Jiffy(json["dateCreated"]).yMMMEd
  );

  @override
  String toString() {
    return 'GService{vehicle: $vehicle, serviceOwner: $serviceOwner, serviceProvider: $serviceProvider, uuid: $uuid, serviceType: $serviceType, description: $description, status: $status, cost: $cost, datePosted: $datePosted, dateCreated: $dateCreated, rate: $rate}';
  }
}