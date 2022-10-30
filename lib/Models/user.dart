class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? tellUsWhereYouFoundUs;
  String? password;


  User(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.tellUsWhereYouFoundUs,
      this.password});

  toRegister() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email" : email,
      "password": password,
      "phone": phone
    };
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, tellUsWhereYouFoundUs: $tellUsWhereYouFoundUs, password: $password}';
  }

  toLogin() {
    return {
      "email": email,
      "password": password
    };
  }
}