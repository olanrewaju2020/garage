import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../Models/vehicle.dart';
import '../misc/validations.dart';

class VehicleBloc with Validations {
  var serviceTypeCtrl = TextEditingController();
  final vehicleCtrl = TextEditingController();
  final complainCtrl = TextEditingController();

  final _vehicleNumber = BehaviorSubject<String>();
  final _company = BehaviorSubject<String>();
  final _regNumber = BehaviorSubject<String>();
  final _color = BehaviorSubject<String>();
  final _image = BehaviorSubject<String>();
  final _model = BehaviorSubject<String>();
  final _ownerId = BehaviorSubject<String>();
  final _vehicle = BehaviorSubject<Vehicle>();
  final _mechanicsName = BehaviorSubject<String>();
  final _serviceType = BehaviorSubject<String>();
  final _serviceDescription = BehaviorSubject<String>();

  Stream<String> get vehicleNumber =>  _vehicleNumber;
  Stream<String> get company => _company.stream.transform(validateName);
  Stream<String> get regNumber => _regNumber.stream;
  Stream<String> get color => _color.stream;
  Stream<String> get image => _image.stream;
  Stream<String> get model => _model.stream;
  Stream<String> get ownerId => _image.stream;
  Stream<Vehicle> get vehicle => _vehicle;
  Stream<String> get mechanicsName => _mechanicsName.stream.transform(validateName);
  Stream<String> get serviceType => _serviceType.stream;
  Stream<String> get serviceDescription => _serviceDescription.stream;

  vehicleNumberOnChanged(String number) => _vehicleNumber.sink.add(number);
  companyOnChanged(String name) => _company.sink.add(name);
  regNumberOnChanged(String value) => _company.sink.add(value);
  colorOnChanged(String value) => _color.sink.add(value);
  imageOnChanged(String value) => _image.sink.add(value);
  modelOnChanged(String value) => _model.sink.add(value);
  ownerIdOnChanged(String value) => _ownerId.sink.add(value);
  serviceDescriptionOnChanged(String value) => _serviceDescription.sink.add(value);

}