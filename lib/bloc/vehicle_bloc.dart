import 'package:rxdart/rxdart.dart';

import '../misc/validations.dart';

class VehicleBloc with Validations {
  final _vehicleNumber = BehaviorSubject<String>();
  final _company = BehaviorSubject<String>();
  final _regNumber = BehaviorSubject<String>();
  final _color = BehaviorSubject<String>();
  final _image = BehaviorSubject<String>();
  final _model = BehaviorSubject<String>();
  final _ownerId = BehaviorSubject<String>();

  Stream<String> get vehicleNumber =>  _vehicleNumber;
  Stream<String> get company => _company.stream.transform(validateName);
  Stream<String> get regNumber => _regNumber.stream;
  Stream<String> get color => _color.stream;
  Stream<String> get image => _image.stream;
  Stream<String> get model => _model.stream;
  Stream<String> get ownerId => _image.stream;

  vehicleNumberOnChanged(String name) => _vehicleNumber.sink.add(name);
  companyOnChanged(String name) => _company.sink.add(name);
  regNumberOnChanged(String value) => _company.sink.add(value);
  colorOnChanged(String value) => _color.sink.add(value);
  imageOnChanged(String value) => _image.sink.add(value);
  modelOnChanged(String value) => _model.sink.add(value);
  ownerIdOnChanged(String value) => _ownerId.sink.add(value);
}