import 'package:flutter/material.dart';
import 'package:testing_class/themes/text_style.dart';
import 'package:testing_class/utils/utils.dart';

import '../themes/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cointype,
        body: SafeArea(
          child: Column(
            children: [],
          ),
        ));
  }
}
