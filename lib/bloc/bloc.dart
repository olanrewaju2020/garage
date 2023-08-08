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
  final dateCtrl = TextEditingController();
  final stateCtrl = TextEditingController();
  final lgaCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  final _insuranceClass = BehaviorSubject<String>();
  final _coverType = BehaviorSubject<String>();
  final _vehicleUse = BehaviorSubject<String>();
  final _policyHolder = BehaviorSubject<String>();
  final _companyName = BehaviorSubject<String>();
  final _nin = BehaviorSubject<String>();
  final _state = BehaviorSubject<String>();
  final _policyDate = BehaviorSubject<String>();
  final _lga = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();

  Stream<String> get insuranceClass =>  _insuranceClass.stream.transform(validateName);
  Stream<String> get coverType => _coverType.transform(validateName);
  Stream<String> get vehicleUse => _vehicleUse;
  Stream<String> get policyHolder => _policyHolder.transform(validateName);
  Stream<String> get companyName => _companyName.transform(validateName);
  Stream<String> get nin => _nin.stream;
  Stream<String> get state => _state.stream;
  Stream<String> get lga => _lga.stream;
  Stream<String> get address => _address;

  insuranceClassOnChanged(String className) => _insuranceClass.sink.add(className);
  coverTypeOnChanged(String type) => _coverType.sink.add(type);
  vehicleUseOnChanged(String type) => _vehicleUse.sink.add(type);
  policyHolderOnChanged(String type) => _policyHolder.sink.add(type);
  companyNameOnChanged(String type) => _companyName.sink.add(type);
  ninOnChanged(String type) => _nin.sink.add(type);
  stateOnChanged(String state) => _state.sink.add(state);
  lgaOnChanged(String lga) => _lga.sink.add(lga);
  addressOnChanged(String address) => _lga.sink.add(address);

  Stream<bool> get isPolicyDataValid =>
      Rx.combineLatest([policyHolder, companyName, nin, state, lga, address], (values) {
        return true;
      });

  dispose() {
    _insuranceClass.close();
    _insuranceClass.drain();
    _coverType.close();
    _coverType.drain();
    _vehicleUse.close();
    _vehicleUse.drain();
    _policyHolder.close();
    _policyHolder.drain();
    _companyName.close();
    _companyName.drain();
    _nin.close();
    _nin.drain();
    _state.close();
    _state.drain();
    _policyDate.close();
    _policyDate.drain();
    _lga.close();
    _lga.drain();
    _address.drain();
    _address.close();
  }

}