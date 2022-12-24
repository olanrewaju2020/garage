import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/Screen/onboarding/create_account.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../misc/enum.dart';
import '../../provider/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GTextField(
                    stream: authBloc.email,
                    hintText: 'Email address',
                    onChanged: authBloc.emailOnChange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      GTextField(
                          stream: authBloc.password,
                          onChanged: authBloc.passwordOnChange,
                          hintText: 'Password'),
                      const Positioned(
                          right: 15, child: Icon(Icons.remove_red_eye))
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      'Forgot password',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Consumer<AuthProvider>(
                  builder: (context, provider, child) {
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () async {
                              provider.login(
                                context: context,
                                email: await authBloc.email.first,
                                password: await authBloc.password.first
                              );
                              if(provider.isLogin) {
                                Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => const Dashboard()));
                              }
                            },
                            child: provider.status == ApiStatus.loading ? const Center(child: CircularProgressIndicator()) :const Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ));
                  },
                ),
                SizedBox(
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new CreateAccount()));
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
        ));
  }
}
