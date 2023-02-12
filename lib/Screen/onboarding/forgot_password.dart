import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';
import '../g_loader.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final bloc = AuthBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff464646),
          size: 20,
        ),
        backgroundColor: Color(0xffEBEBEB),
        elevation: 0,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0xff21B24B)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Enter your account name and registered email to receive a verification code',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Color(0xff646464)),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                            'Email',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: GTextField(
                            prefixIconData: Icons.email_outlined,
                            hintText: 'Email address here',
                            stream: bloc.email,
                            onChanged: bloc.emailOnChange,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: GButton(
                              isValid: bloc.isForgotFormValid,
                              onPressed: () async {
                                String email = await bloc.email.first;
                                provider.sendOtp(
                                    email: email, context: context);
                              },
                              label: "Send"),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
