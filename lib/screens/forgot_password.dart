import 'package:auth_ui_tutorial/screens/register_screen.dart';
import 'package:auth_ui_tutorial/theme.dart';
import 'package:auth_ui_tutorial/widgets/input_field.dart';
import 'package:auth_ui_tutorial/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'new_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your email \naccount",
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/accent.png',
                    width: 99,
                    height: 4,
                  )
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Column(
                children: [
                  InputField(
                      hintText: 'Email',
                      suffixIcon: SizedBox(),
                      controller: emailController),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Validate Email',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewPasswordScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
