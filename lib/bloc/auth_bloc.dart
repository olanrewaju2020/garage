import 'package:flutter/material.dart';
import 'package:garage_repair/misc/helper.dart';
import 'package:garage_repair/misc/validations.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc with Validations{
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _newPassword = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _category = BehaviorSubject<String>();
  final _serviceType= BehaviorSubject<String>();
  final _aboutUs = BehaviorSubject<String>();

  final categoryCtrl = TextEditingController();
  final serviceTypeCtrl = TextEditingController();

  //validations
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get newPassword => _newPassword.stream.transform(validatePassword);
  Stream<String> get phone => _phone.stream.transform(validatePhone);
  Stream<String> get category => _category.stream;
  Stream<String> get serviceType => _serviceType.stream;
  Stream<String> get aboutUs => _aboutUs.stream;

  firstNameOnChange(String name) => _firstName.sink.add(name);
  lastNameOnChange(String name) => _lastName.sink.add(name);
  emailOnChange(String mail) =>  _email.sink.add(mail);
  passwordOnChange(String secret) => _password.sink.add(secret);
  newPasswordOnChange(String secret) => _newPassword.sink.add(secret);
  phoneOnChange(String number) => _phone.sink.add(number);
  aboutUsOnChange(String word) => _aboutUs.sink.add(word);
  categoryOnChange(String word) => _category.sink.add(word);
  serviceOnChange(String word) => _serviceType.sink.add(word);

  Stream<bool> get isForgotFormValid =>
      Rx.combineLatest([email], (values) => true);

  Stream<bool> get isLoginFormValid =>
      Rx.combineLatest([email, password], (values) => true);

  Stream<bool> get isChangePasswordFormValid =>
      Rx.combineLatest([password, newPassword], (values) => true);

  Stream<bool> get isCreateAccountValid =>
      Rx.combineLatest([email, password, firstName, lastName, phone, category, serviceType], (values) => true);

  @mustCallSuper
  void dispose() {
    Helper.reset([_email, _firstName, _lastName, _email,
      _password, _phone, _aboutUs ]);

  }
}