
import 'package:garage_repair/misc/validations.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc with Validations{
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _aboutUs = BehaviorSubject<String>();

  //validations
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get phone => _phone.stream.transform(validatePhone);
  Stream<String> get aboutUs => _aboutUs.stream;


  firstNameOnChange(String name) => _firstName.sink.add(name);
  lastNameOnChange(String name) => _lastName.sink.add(name);
  emailOnChange(String email) =>  _email.sink.add(email);
  passwordOnChange(String secret) => _password.sink.add(secret);
  phoneOnChange(String number) => _phone.sink.add(number);
  aboutUsOnChange(String word) => _aboutUs.sink.add(word);

}