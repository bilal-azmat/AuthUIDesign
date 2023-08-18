import 'package:auth_ui_tutorial/screens/register_screen.dart';
import 'package:auth_ui_tutorial/theme.dart';
import 'package:auth_ui_tutorial/widgets/input_field.dart';
import 'package:auth_ui_tutorial/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  bool passwordVisible=false;

  void togglePassword(){
    setState(() {
      passwordVisible=!passwordVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24,48,24,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login to your \naccount",
                    style: heading2.copyWith(color: textBlack),

                  ),
                  SizedBox(height: 20,),
                  Image.asset('assets/images/accent.png',
                  width: 99,
                    height: 4,
                  )
                ],
              ),
              SizedBox(height: 48,),
              Form(
                child: Column(
                  children: [
                    InputField(hintText: 'Email', suffixIcon: SizedBox(), controller: emailController),
                    SizedBox(height: 32,),
                    InputField(hintText: 'Password', suffixIcon: IconButton(
                      color: textGrey,
                      splashRadius: 1,
                      icon: Icon(passwordVisible?Icons.visibility_outlined
                      : Icons.visibility_off_outlined
                      ), onPressed: togglePassword,
                    ),

                        controller: passwordController),

                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));

                    },
                    child: Text("forgot your password?",
                    style: TextStyle(
                      color: primaryBlue
                    ),
                    )),
              ),
              SizedBox(height: 64,),
              CustomPrimaryButton(buttonColor: primaryBlue, textValue: 'Login', textColor: Colors.white, onPressed: (){

              }),
              SizedBox(height: 24,),
              Center(
                child: Text("OR",
                style: heading6.copyWith(color:textGrey),
                ),

              ),
              SizedBox(height: 24,),
    CustomPrimaryButton(buttonColor: Color(0xfffbfbfb),
        textValue: 'Login With Google',
        textColor: Colors.black, onPressed: (){}),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                  style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    },
                    child: Text("Register",
                    style: regular16pt.copyWith(color: primaryBlue),
                    ),
                  )
                ],
              )



    ],
          ),
        ),
      ),
    );
  }
}
