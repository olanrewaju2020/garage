import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:rxdart/rxdart.dart';

import '../Models/user.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';

class AuthProvider extends ChangeNotifier with Validations {
  ApiStatus status = ApiStatus.none;

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
      return true;
    }
    return false;
  }

  void login({required String email, required String password, required BuildContext context}) async {
    status = ApiStatus.loading;
    final response = await RestService().method(
        method: 'POST', url: 'entrance/login', body: User(
      email: email,
      password: password
    ).toLogin());

    status = ApiStatus.done;

    notifyListeners();
    if(response.isSuccessful) {
      Navigator.push(context, MaterialPageRoute(
              builder: (context) => const Dashboard()));
    }
  }
}
