import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../Models/vehicle.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Screen/misc/utils.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';

class VehicleProvider extends ChangeNotifier with Validations {
  bool status = false;

  void vehicleStore(
      {required String vehicleNumber,
      required String company,
      required String color,
      required String model,
      required String image,
      required ownerId,
      required BuildContext context}) {
    status = true;
    notifyListeners();
    RestService()
        .method(
            method: 'POST',
            url: 'entrance/login',
            body: Vehicle().toSaveVehicle())
        .then((response) {
      if (response.isSuccessful) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
      }
    });
    status = false;
    notifyListeners();
  }

  Future<List<Vehicle>> vehicleList() async {
    status = true;
    notifyListeners();
    RestService().method(method: "GET", url: 'vehicle/list').then((response) {
      if (response.isSuccessful) {
        return List<Vehicle>.from(response.data.map((vehicle) => Vehicle.fromJson(vehicle)));
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
        return List<Vehicle>.empty();
      }
    });

    status = false;
    notifyListeners();
    return List<Vehicle>.empty();
  }

  Future<Vehicle> vehicle() async {
    status = true;
    notifyListeners();
    RestService().method(method: 'GET', url: 'vehicle/retrievesingle').then((response){
      if(response.isSuccessful){
        return Vehicle.fromJson(response.data);
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
        return null;
      }
    });
    status =false;
    notifyListeners();
    return Vehicle();
  }

  void updateVehicle(
      {required String vehicleNumber,
      required String company,
      required String color,
      required String model,
      required String image,
      required ownerId,
      required BuildContext context}) {
    status =true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/update').then((response){
      if(response.isSuccessful){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }

    });
    status =false;
    notifyListeners();
  }

  void deleteVehicle({required BuildContext context, required String number}) {
    status =true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/remove').then((response){
      if(response.isSuccessful){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }

    });
    status =false;
    notifyListeners();
  }


}
