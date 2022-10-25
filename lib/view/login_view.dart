import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_class/res/components/round_buttons.dart';
import 'package:testing_class/themes/text_style.dart';
import 'package:testing_class/utils/utils.dart';

import '../themes/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: CustomText(
              text: 'ekite',
            ),
          ),
          backgroundColor: Color.fromARGB(255, 196, 27, 27),
        ),
        backgroundColor: AppColors.cointype,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined)),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: "*",
                        focusNode: passwordFocusNode,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(_obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility))),
                      );
                    }),
                SizedBox(
                  height: height * .1,
                ),
                RoundedButton(
                    title: 'Login',
                    onpress: () {
                      if (_emailController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please Enter Email', context);
                      } else if (_passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please Enter Password', context);
                      } else if (_passwordController.text.length > 6) {
                        Utils.flushBarErrorMessage(
                            'Please Enter 6 Digits Password', context);
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
