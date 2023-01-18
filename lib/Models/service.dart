import 'user.dart';
import 'vehicle.dart';

class Service {
  Vehicle? vehicle;
  User? serviceOwner;
  User? serviceProvider;
  String? uuid, serviceType, description, status;
  double? cost;
  DateTime? datePosted, dateCreated;
  var rate;

  Service({this.uuid, this.serviceType, this.cost, this. rate, this.status,
      this.description, this.vehicle, this.serviceOwner, this.serviceProvider,
      this.datePosted, this.dateCreated
});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    uuid: json["uuid"],
    serviceType: json["serviceType"],
    cost: json["2000"],
    rate: json["rate"],
    description: json["description"],
    vehicle: Vehicle.fromServiceJson(json["vehicle"]),
    serviceOwner: User.fromOwnerJson(json["serviceOwner"]),
    serviceProvider: User.fromOwnerJson(json["serviceProvider"]),
    datePosted: json["datePosted"],
    dateCreated: json["dateCreated"]
  );
}