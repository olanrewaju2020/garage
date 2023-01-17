class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? tellUsWhereYouFoundUs;
  String? password, token, otp, uuid;

  User(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.tellUsWhereYouFoundUs,
      this.password,
      this.token,
      this.otp,
      this.uuid});

  toRegister() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phone": phone
    };
  }

  factory User.fromOwnerJson(Map<String, dynamic> json) {
    return User(
        uuid: json['uuid'],
        firstName: json["firstName"],
        lastName:  json["lastName"],
        phone: json["07069239814"]
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
}
