import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/create_account.dart';
import 'package:garage_repair/Screen/onboarding/forgot_password.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';
import '../g_loader.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authBloc = AuthBloc();

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffEBEBEB),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const GLoader()
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Color(0xff757676),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text.rich(TextSpan(
                                text: "Don’t have an account  ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6A6F73)),
                                children: [
                                  TextSpan(
                                    text: " Sign Up",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Username/Email',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: [
                                GTextField(
                                  prefixIconData: Icons.email_outlined,
                                  stream: _authBloc.email,
                                  hintText: 'Email address',
                                  onChanged: _authBloc.emailOnChange,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                GTextField(
                                    prefixIconData: Icons.lock,
                                    isSecret: true,
                                    stream: _authBloc.password,
                                    onChanged: _authBloc.passwordOnChange,
                                    suffixIconData:
                                        Icons.remove_red_eye_outlined,
                                    hintText: 'Password'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                      color: Color(0xff21B24B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: GButton(
                                  isValid: _authBloc.isLoginFormValid,
                                  label: 'Log in',
                                  onPressed: () async {
                                    provider.login(
                                        context: context,
                                        email:
                                            await _authBloc.email.first ?? '',
                                        password:
                                            await _authBloc.password.first);
                                  },
                                ),
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount()));
                            },
                            child: const Center(
                              child: Text.rich(TextSpan(
                                text: "Don't have an account",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: " Register",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
