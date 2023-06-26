import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../misc/validations.dart';

class Bloc with Validations{
  final insuranceClassCtrl = TextEditingController();
  final coverTypeCtrl = TextEditingController();
  final vehicleUseCtrl = TextEditingController();
  final policyHolderCtrl = TextEditingController();
  final companyNameCtrl = TextEditingController();
  final ninCtrl = TextEditingController();

  final _insuranceClass = BehaviorSubject<String>();
  final _coverType = BehaviorSubject<String>();
  final _vehicleUse = BehaviorSubject<String>();
  final _policyHolder = BehaviorSubject<String>();
  final _companyName = BehaviorSubject<String>();
  final _nin = BehaviorSubject<String>();

  Stream<String> get insuranceClass =>  _insuranceClass;
  Stream<String> get coverType => _coverType;
  Stream<String> get vehicleUse => _vehicleUse;
  Stream<String> get policyHolder => _policyHolder;
  Stream<String> get companyName => _companyName;
  Stream<String> get nin => _nin;

  insuranceClassOnChanged(String className) => _insuranceClass.sink.add(className);
  coverTypeOnChanged(String type) => _coverType.sink.add(type);
  vehicleUseOnChanged(String type) => _vehicleUse.sink.add(type);
  policyHolderOnChanged(String type) => _policyHolder.sink.add(type);
  companyNameOnChanged(String type) => _companyName.sink.add(type);
  ninOnChanged(String type) => _companyName.sink.add(type);


}