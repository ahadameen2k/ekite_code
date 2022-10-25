import 'package:flutter/material.dart';
import 'package:testing_class/themes/colors.dart';
import 'package:testing_class/themes/text_style.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundedButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: Center(
            child: loading
                ? const CircleAvatar()
                : CustomText(
                    text: title,
                  )),
      ),
    );
  }
}
