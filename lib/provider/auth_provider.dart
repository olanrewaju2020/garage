import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/misc/utils.dart';

import '../Models/user.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/misc/enum.dart';
import '../Screen/onboarding/login.dart';
import '../Service/rest_service.dart';
import '../misc/validations.dart';

class AuthProvider extends ChangeNotifier with Validations {
  bool isLoading = false;
  String? _email;
  bool _isActivated = false;
  User? _user;

  String get email => _email ?? '';
  bool get isActivated => _isActivated;
  User get user => _user ?? User();


  Future<bool> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String aboutUs}) async {
    isLoading = true;
    notifyListeners();
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
    isLoading = false;
    notifyListeners();
    if(response.isSuccessful){
      _email = email;
      return true;
    }
    return false;
  }

  void login({required String email, required String password, required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: 'POST', url: 'entrance/login', body: User(
      email: email,
      password: password
    ).toLogin()).then((response){
      if(response.isSuccessful) {
        _user = User.fromAuthJson(response.data);
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => const Dashboard()));
      } else {
        ShowToast(msg: response.error , type: ErrorType.error);
      }
    });

    isLoading = false;
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const Dashboard()));

  }

  activateUser({required String otp,required BuildContext context}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: "POST", url: 'entrance/activate', body: User(
      email: _email, otp: otp
    ).toActivateJson()).then((response){
      if(response.isSuccessful) {
        ShowToast(msg: response.data, type: ErrorType.success);
        _isActivated = true;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Login()));
      } else {
        ShowToast(msg: response.data, type: ErrorType.error);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  resetPassword({required String email}) {
    isLoading = true;
    RestService().method(
        method: 'POST',
        url: "entrance/password/forgot",
       body: {
         "newPassword": "busayo@23",
         "otp" : "zqbapy",
         "email": "femisola@gmail.com"
       }
    );
  }
}
