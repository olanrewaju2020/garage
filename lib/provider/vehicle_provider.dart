import 'dart:async';

import 'package:flutter/material.dart';
import '../Models/service.dart';
import '../Models/user.dart';
import '../Models/vehicle.dart';
import '../Models/vehicle_service.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../misc/enum.dart';
import '../misc/utils.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';
import '../service_locator.dart';

class VehicleProvider extends ChangeNotifier with Validations {
  bool isLoading = false;
  final List<String> _searchLocations = [];
  Vehicle? _vehicle;
  List<Vehicle> get vehicles => app.vehicles;

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
        .httpMethod(
            method: 'POST', url: 'vehicle/add', body: Vehicle().toSaveVehicle())
        .then((response) {
      if (response.isSuccessful) {
        vehiclesOwnList(ownerId: app.user.uuid ?? '');
        isLoading = false;
        notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dashboard(currentIndex: 2)));
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

  vehiclesOwnList({required String ownerId}) {
    isLoading = true;
    notifyListeners();
    RestService()
        .httpMethod(method: 'GET', url: 'vehicle/list/by-owner/$ownerId')
        .then((response) {
      if (response.isSuccessful) {
        app.vehiclesOwn = List<Vehicle>.from(
            response.data.map((vehicle) => Vehicle.fromJson(vehicle))).toList();
        notifyListeners();
      } else {
        app.vehiclesOwn = [];
      }
    });
    isLoading = false;
    notifyListeners();
  }

  Future<List<Vehicle>> vehicleList() async {
    isLoading = true;
    notifyListeners();
    RestService().httpMethod(method: "GET", url: 'vehicle/list').then((response) {
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
        .httpMethod(method: 'GET', url: 'vehicle/retrieve')
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
    RestService().httpMethod(method: 'PUT', url: 'vehicle/update').then((response) {
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
    RestService().httpMethod(method: 'PUT', url: 'vehicle/remove').then((response) {
      if (response.isSuccessful) {
        isLoading = false;
        notifyListeners();
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

  void getServiceByOwner({required BuildContext context}) {
    isLoading = true;
    notifyListeners();
    RestService()
        .httpMethod(
            method: 'GET', url: 'service/fetch/owner/${app.user.uuid ?? ""}')
        .then((response) {
      if (response.isSuccessful) {
        isLoading = false;
        app.servicesByOwner = List<GService>.from(
            response.data.map((service) => GService.fromJson(service)));

      } else {
        app.servicesByOwner = [];
        isLoading = false;
        ShowToast(msg: response.message, type: ErrorType.error);
      }

      notifyListeners();
    });
  }

  serviceCompanies(String serviceType){
    isLoading = true;
    notifyListeners();
    RestService()
        .httpMethod(
        method: 'GET', url: '/user/fetch/$serviceType')
        .then((response) {
      if (response.isSuccessful) {
        isLoading = false;
        app.serviceVendors = List<User>.from(
            response.data.map((user) => User.fromJson(user)));
        notifyListeners();

      } else {
        app.serviceVendors = [];
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.message, type: ErrorType.error);
      }
    });
  }

  void requestNewService({required BuildContext context, required VehicleService request}) {
    isLoading = true;
    notifyListeners();
    RestService().httpMethod(
        method:'POST',
        url: 'service/new',
      body: request.toNewService()
    ).then((response) {
      if(response.isSuccessful) {
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.data, type: ErrorType.success);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Dashboard())
        );
      } else {
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.error, type: ErrorType.error);
      }
    });
  }


  void setVendor(vendor) {
    app.vendor = vendor;
    notifyListeners();
  }

  void fetchServiceByCar({required String vehicleId}) {
    isLoading = true;
    notifyListeners();
    RestService().httpMethod(
      method: 'GET',
      url: 'service/fetch/car/$vehicleId'
    ).then((response) {
      if(response.isSuccessful) {
        isLoading = false;
        app.servicesByCar = List<GService>.from(response.data.map((service) => GService.fromJson(service)));
        notifyListeners();
        // Navigator.of(context)
      } else {
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.error, type: ErrorType.error);
      }
    });
  }

  set recentSearchLocation(String text) {
    _searchLocations.add(text);
    notifyListeners();
  }
  List<String> get recentSearchedLocations => _searchLocations;

}
