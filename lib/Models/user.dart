class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? tellUsWhereYouFoundUs;
  String? password, token, otp;
  var uuid;

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

  factory User.fromAuthJson(Map<String, dynamic> json) {
    return User(
        token: "token",
        firstName: "firstName",
        lastName: "lastName",
        uuid: "uuid",
        email: "email",
        phone: "phone");
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
}
