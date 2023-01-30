import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';
import '../../misc/enum.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_text_field.dart';
import '../../misc/utils.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final bloc = AuthBloc();
  final confirmPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                    hintText: 'Old Password',
                    stream: bloc.password,
                    isSecret: true,
                    onChanged: bloc.passwordOnChange),
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                    hintText: 'New Password',
                    stream: bloc.newPassword,
                    isSecret: true,
                    onChanged: bloc.newPasswordOnChange),
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                  hintText: 'Confirm Password',
                  stream: Stream.value(confirmPasswordCtrl.text),
                  controller: confirmPasswordCtrl,
                  isSecret: true
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: GButton(
                    isValid: bloc.isChangePasswordFormValid,
                    onPressed: () async {
                      if(await bloc.newPassword.first == confirmPasswordCtrl.text) {
                       provider.changePassword(context: context, userPassword:
                        User(oldPassword: await bloc.password.first, password: await bloc.newPassword.first));
                      } else {
                        ShowToast(msg: 'Password field do not match', type: ErrorType.error);
                      }
                    },
                    label: 'Change Password',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
