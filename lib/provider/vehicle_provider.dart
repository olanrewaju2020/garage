import 'dart:async';

import 'package:flutter/material.dart';
import '../Models/vehicle.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Screen/misc/utils.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';
import '../service_locator.dart';

class VehicleProvider extends ChangeNotifier with Validations {
  bool isLoading = false;
  Vehicle? _vehicle;

  Vehicle? get vehicle => _vehicle;
  List<Vehicle> get vehiclesOwn => app.vehiclesOwn;

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
    RestService()
        .method(
            method: 'POST', url: 'vehicle/add', body: Vehicle().toSaveVehicle())
        .then((response) {
      if (response.isSuccessful) {
        vehiclesOwnList(ownerId: app.user?.uuid ?? '');
        isLoading = false;
        notifyListeners();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard(currentIndex: 2)));
      } else {
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.error, type: ErrorType.error);
      }
    });
  }

  vehicleOnChanged(String number) {
    Vehicle vehicle = app.vehicles
        .where((element) => element.vehicleNumber?.startsWith(number) ?? false)
        .first;
    app.vehicles.add(vehicle);
  }

  List<Vehicle> get vehicles => app.vehicles;

  vehiclesOwnList({required String ownerId}) {
    isLoading = true;
    notifyListeners();
    RestService()
        .method(method: 'GET', url: 'vehicle/list/by-owner/$ownerId')
        .then((response) {
      if (response.isSuccessful) {
        app.vehiclesOwn = response.data == null
            ? []
            : List<Vehicle>.from(
                    response.data.map((vehicle) => Vehicle.fromJson(vehicle)))
                .toList();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  Future<List<Vehicle>> vehicleList() async {
    isLoading = true;
    notifyListeners();
    RestService().method(method: "GET", url: 'vehicle/list').then((response) {
      if (response.isSuccessful) {
        app.vehicles = List<Vehicle>.from(
            response.data.map((vehicle) => Vehicle.fromJson(vehicle))).toList();
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
        return List<Vehicle>.empty();
      }
    });

    isLoading = false;
    notifyListeners();
    return List<Vehicle>.empty();
  }

  Future<Vehicle> getVehicle() async {
    isLoading = true;
    notifyListeners();
    //add ownerId to url
    RestService()
        .method(method: 'GET', url: 'vehicle/retrieve')
        .then((response) {
      if (response.isSuccessful) {
        return Vehicle.fromJson(response.data);
      } else {
        ShowToast(msg: response.error, type: ErrorType.error);
        return Vehicle();
      }
    });
    isLoading = false;
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
    isLoading = true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/update').then((response) {
      if (response.isSuccessful) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void deleteVehicle({required BuildContext context, required String number}) {
    isLoading = true;
    notifyListeners();
    RestService().method(method: 'PUT', url: 'vehicle/remove').then((response) {
      if (response.isSuccessful) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        ShowToast(msg: response.message, type: ErrorType.success);
      } else {
        ShowToast(msg: response.message, type: ErrorType.error);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void getVehiclesByOwner() {}
}
