import 'dart:async';

import 'package:rules/rules.dart';

mixin Validations {
  var validateEmail=StreamTransformer<String,String>.fromHandlers(
      handleData: (email, sink){
        final rule = Rule(
          email,
          name: 'Email Field',
          isRequired: true,
          isEmail: true,
        );
        if(rule.hasError) {
          sink.addError(rule.error!);
        } else {
          sink.add(email);
        }
      }
  );

  var validateName=StreamTransformer<String,String>.fromHandlers(
      handleData: (name, sink){
        final rule = Rule(
          name,
          name: 'Name Field',
          isRequired: true,
          isAlphaSpace: true,
          minLength: 4,
          maxLength: 20
        );
        if(rule.hasError) {
          sink.addError(rule.error!);
        } else {
          sink.add(name);
        }
      }
  );

  var validatePhone=StreamTransformer<String,String>.fromHandlers(
      handleData: (phone, sink){
        final rule = Rule(
          phone,
          name: 'Phone Field',
          isRequired: true,
          isPhone: true,
        );
        if(rule.hasError) {
          sink.addError(rule.error!);
        } else {
          sink.add(phone);
        }
      }
  );

  var validatePassword =StreamTransformer<String,String>.fromHandlers(
      handleData: (password, sink){
        final rule = Rule(
          password,
          name: 'Email Field',
          isRequired: true,
          isAlphaNumeric: true,
        );
        if(rule.hasError) {
          sink.addError(rule.error!);
        } else {
          sink.add(password);
        }
      }
  );
}