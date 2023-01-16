import 'dart:async';

import 'package:flutter/material.dart';
import '../Models/vehicle.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Screen/misc/utils.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';

class VehicleProvider extends ChangeNotifier with Validations {
  bool isLoading = false;
  List<Vehicle> _vehicles = [];
  Vehicle? _vehicle;

  Vehicle? get vehicle => _vehicle;
  set vehicle(Vehicle? vehicle) {
    _vehicle = vehicle;
    notifyListeners();
  }


  void vehicleStore(
      {required String vehicleNumber,
      required String company,
      required String color,
      required String model,
      required String image,
      required ownerId,
      required BuildContext context}) {
        isLoading = true;
        notifyListeners();
        print("===========================vehicle store");
        // RestService()
        //     .method(
        //         method: 'POST',
        //         url: 'entrance/login',
        //         body: Vehicle().toSaveVehicle())
        //     .then((response) {
        //   print("=============================vehicle store");
        //   print(response);
        //   if (response.isSuccessful) {
        //     print("=============================vehicle store isSuccessful");
        //     print(response);
        //     isLoading = false;
        //     notifyListeners();
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => Dashboard()));
        //   } else {
        //     isLoading = false;
        //     notifyListeners();
        //     ShowToast(msg: response.error, type: ErrorType.error);
        //   }
        // });
  }

  vehicleOnChanged(String number) {
    Vehicle vehicle = _vehicles.where((element) => element.vehicleNumber?.startsWith(number) ?? false).first;
    _vehicles.add(vehicle);
  }

  List<Vehicle> get vehicles => _vehicles;

  Future<List<Vehicle>> vehicleList() async {
    isLoading = true;
    notifyListeners();
    _vehicles = [
        Vehicle.fromJson({
          "vehicleNumber" : "123LOE",
          "company": "John and son",
          "regNumber": "1123QW",
          "color" :"Gray",
          "model" : "2015",
          "image" : "Car",
          "userProviderUuid" : "9d2a968d-f240-45ae-99cc-6c25446d5c87",
          "status" : "Started"
        }),
        Vehicle.fromJson({
          "vehicleNumber" : "678LOE",
          "company": "SegDap Group",
          "regNumber": "1123QW",
          "color" :"Gray",
          "model" : "2015",
          "image" : "Car",
          "userProviderUuid" : "9d2a968d-f240-45ae-99cc-6c25446d5c87",
          "status" : "In progress"
        }),
        Vehicle.fromJson({
          "vehicleNumber" : "859LOE",
          "company": "Dap Ltd",
          "regNumber": "1123QW",
          "color" :"Gray",
          "model" : "2015",
          "image" : "Car",
          "userProviderUuid" : "9d2a968d-f240-45ae-99cc-6c25446d5c87",
          "status" : "Completed"
        })
      ];
    // RestService().method(method: "GET", url: 'vehicle/list').then((response) {
    //   if (response.isSuccessful) {
    //     return List<Vehicle>.from(response.data.map((vehicle) => Vehicle.fromJson(vehicle)));
    //   } else {
    //     ShowToast(msg: response.error, type: ErrorType.error);
    //     return List<Vehicle>.empty();
    //   }
    // });

    isLoading = false;
    notifyListeners();
    return List<Vehicle>.empty();
  }

  Future<Vehicle> getVehicle() async {
    isLoading = true;
    notifyListeners();
    RestService().method(method: 'GET', url: 'vehicle/retrievesingle').then((response){
      if(response.isSuccessful){
        return Vehicle.fromJson(response.data);
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
        return null;
      }
    });
    isLoading =false;
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
    isLoading =true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/update').then((response){
      if(response.isSuccessful){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }

    });
    isLoading =false;
    notifyListeners();
  }

  void deleteVehicle({required BuildContext context, required String number}) {
    isLoading =true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/remove').then((response){
      if(response.isSuccessful){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }

    });
    isLoading =false;
    notifyListeners();
  }


}
