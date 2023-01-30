import '../service_locator.dart';

class User {
  String? firstName, lastName, phone, email, tellUsWhereYouFoundUs,
      address, createdAt, password, oldPassword, token, otp, uuid, aboutUs,
      category, serviceType;
  bool accountStatus;

  User(
      {this.firstName,
      this.lastName,
      this.phone,
        this.address,
      this.email,
      this.tellUsWhereYouFoundUs,
      this.password,
      this.token,
      this.otp, this.accountStatus = false, this.createdAt,
      this.uuid, this.aboutUs, this.category, this.serviceType, this.oldPassword});

  toRegister() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "aboutUs": aboutUs,
      "category": category,
      "serviceList": serviceType,
    };
  }

  factory User.fromOwnerJson(Map<String, dynamic> json) {
    return User(
        uuid: json['uuid'],
        firstName: json["firstName"],
        lastName:  json["lastName"],
        phone: json["phone"]
    );
  }

  factory User.fromAuthJson(Map<String, dynamic> json) {
    return User(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        uuid: json["uuid"],
        email: json["email"],
        phone: json["phone"]);
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, tellUsWhereYouFoundUs: $tellUsWhereYouFoundUs, password: $password}';
  }

  toLogin() {
    return {"email": email, "password": password};
  }

  toActivateJson() {
    return {"otp": otp, "email": email};
  }

  toEmail()  => {"email": email};

  factory User.fromJson(Map<String, dynamic>service) => User(
      uuid: service["uuid"],
      accountStatus: service["accountStatus"],
      firstName: service["firstName"],
      lastName: service["lastName"],
      email:service["email"],
       phone: service["phone"],
       category: service["category"],
       serviceType: service["serviceList"],
       createdAt: service["createdAt"],
       address: service["address"]
  );

  toChangePasswordJson() => {
      " newPassword": password,
      "oldPassword" :oldPassword,
      "email": app.user?.email ?? ''
  };

  toUpdateDetailJson() => {
    "firstName" : firstName,
    "lastName": lastName,
    "name": firstName,
    "email": email,
    // "password" : "sola@12",
    // "phone" : phone,
    // "category": "Toyota",
    // "contact": "No 2, somarin obantoko",
    // "account_type": "Current Account",
    // "account_disable": "Active"
  };
}
