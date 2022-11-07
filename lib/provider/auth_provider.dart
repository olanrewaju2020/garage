import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/misc/utils.dart';

import '../Models/user.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';

class AuthProvider extends ChangeNotifier with Validations {
  ApiStatus status = ApiStatus.none;
  String? _email;
  bool _isActivated = false;
  bool _isLogin = false;
  User? _user;

  String get email => _email ?? '';
  bool get isActivated => _isActivated;
  bool get isLogin => _isLogin;
  User get user => _user ?? User();


  Future<bool> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String aboutUs}) async {
    final response = await RestService().method(
        method: 'POST',
        url: 'entrance/signup',
        body: User(
                firstName: firstName,
                lastName: lastName,
                email: email,
                phone: phone,
                password: password)
            .toRegister());
    if(response.isSuccessful){
      _email = email;
      return true;
    }
    return false;
  }

  void login({required String email, required String password, required BuildContext context}) async {
    status = ApiStatus.loading;
    notifyListeners();
    final response = await RestService().method(
        method: 'POST', url: 'entrance/login', body: User(
      email: email,
      password: password
    ).toLogin());

    _isLogin = response.isSuccessful;
    _user = User.fromAuthJson(response.data);

    status = ApiStatus.done;
    notifyListeners();
  }

  activateUser({required String otp}) async {
    final response = await RestService().method(
        method: "POST", url: 'entrance/activate', body: User(
      email: _email, otp: otp
    ).toActivateJson());
    if(response.isSuccessful) {
      ShowToast(msg: response.data, type: ErrorType.success);
      _isActivated = true;
    } else {
      ShowToast(msg: response.data, type: ErrorType.error);
    }

    notifyListeners();
  }
}
