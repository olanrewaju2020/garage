import 'package:flutter/material.dart';
import 'package:garage_repair/misc/utils.dart';

import '../Models/user.dart';
import '../Screen/Dashboard/dashboard.dart';
import '../Screen/onboarding/login.dart';
import '../Screen/onboarding/new_password.dart';
import '../Service/rest_service.dart';
import '../misc/enum.dart';
import '../misc/validations.dart';
import '../service_locator.dart';

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
      required String aboutUs, required String category, required String serviceType}) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> request = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
        aboutUs: aboutUs,
        category: category,
        serviceType: serviceType,
    )
        .toRegister();
    final response = await RestService().method(
        method: 'POST',
        url: 'entrance/signup',
        body: request);
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
    await RestService().method(
        method: 'POST', url: 'entrance/login', body: User(
      email: email,
      password: password
    ).toLogin()).then((response){
      if(response.isSuccessful) {
        _user = User.fromAuthJson(response.data);
        app.user = _user ?? User();
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Dashboard()));
      } else {
        ShowToast(msg: response.error , type: ErrorType.error);
      }
    });

    isLoading = false;
    notifyListeners();
  }

  activateUser({required String otp,required BuildContext context}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: "POST", url: 'entrance/activate', body: User(
      email: _email, otp: otp
    ).toActivateJson()).then((response){
      if(response.isSuccessful) {
        isLoading = false;
        notifyListeners();
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

  sendOtp({required String email, required BuildContext context}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: 'POST',
        url: "entrance/send-otp",
        body: User(email: email).toEmail()
    ).then((response) {
        if(response.isSuccessful) {
          isLoading = false;
          notifyListeners();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewPassword())
          );
        } else {
          isLoading = false;
          notifyListeners();
          ShowToast(msg: response.error, type: ErrorType.error);
        }
    });
    isLoading = false;
    notifyListeners();
  }

  resetPassword({required String email, required String newPassword, required String otp}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: 'POST',
        url: "entrance/password/forgot",
       body: {
         "newPassword": newPassword,
         "otp" : otp,
         "email": email
       }
    );
    isLoading = false;
    notifyListeners();
  }

  void changePassword({required User userPassword,required BuildContext context}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
        method: 'POST',
        url: "entrance/password/change",
        body: User().toChangePasswordJson()
    ).then((response) {
      if(response.isSuccessful) {
        isLoading = false;
        notifyListeners();
        ShowToast(msg: response.data);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Dashboard())
        );
      }else {
        isLoading = false;
        notifyListeners();
        ShowToast(msg:response.error, type: ErrorType.error);
      }
    });

  }

  updateProfile({required BuildContext context, required User user}) {
    isLoading = true;
    notifyListeners();
    RestService().method(
      method: 'PUT',
      url: 'user/update/${app.user.uuid}',
      body: user.toUpdateDetailJson()
    ).then((response) {
      if(response.isSuccessful) {
        isLoading = false;
        notifyListeners();
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
}
