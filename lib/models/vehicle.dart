import 'package:jiffy/jiffy.dart';

import 'user.dart';

class Vehicle {
  String? vehicleNumber;
  String? company;
  String? regNumber;
  String? color;
  String? image, model, uuid, userUuid, status, createdAt;
  User? owner;

  Vehicle(
      {this.vehicleNumber,
      this.company,
      this.regNumber,
      this.color,
      this.image,
      this.model,
      this.uuid,
      this.userUuid,
      this.owner,
      this.status, this.createdAt});

  toSaveVehicle() => {
        "uuid": uuid,
        "vehicleNumber": vehicleNumber,
        "company": company,
        "regNumber": regNumber,
        "color": color,
        "model": model,
        "image": image,
        "status": status,
        "userUuid": owner?.uuid ?? ''
      };

  factory Vehicle.fromJson(Map<String, dynamic> vehicle) {
    return Vehicle(
        uuid: vehicle['uuid'],
        vehicleNumber: vehicle['vehicleNumber'],
        company: vehicle['company'],
        regNumber: vehicle['regNumber'],
        color: vehicle['color'],
        model: vehicle['model'],
        image: vehicle['image'],
        createdAt: Jiffy.parse(vehicle['createdAt']).yMMMEd,
        owner: User.fromOwnerJson(vehicle["owner"]));
  }

  factory Vehicle.fromServiceJson(Map<String, dynamic> vehicle) => Vehicle(
      uuid: vehicle["uuid"],
      vehicleNumber: vehicle["vehicleNumber"],
      company: vehicle["company"]);

  @override
  String toString() {
    return 'Vehicle{vehicleNumber: $vehicleNumber, company: $company, regNumber: $regNumber, color: $color, image: $image, model: $model, uuid: $uuid, userUuid: $userUuid, status: $status, createdAt: $createdAt, owner: $owner}';
  }
}
