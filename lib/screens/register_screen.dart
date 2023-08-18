
import 'package:auth_ui_tutorial/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  bool passwordVisible=false;

  bool isCheck=false;

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24,48,24,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Register new \naccount",
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
                      InputField(hintText: 'Name', suffixIcon: SizedBox(), controller: nameController),

                      SizedBox(height: 32,),
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
                      SizedBox(height: 24,),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isCheck=!isCheck;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isCheck?primaryBlue:Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: isCheck?null:Border.all(color: textGrey,width: 1.5)
                            ),
                            width: 20,
                            height: 20,
                            child: isCheck?
                            Icon(Icons.check,
                            size: 20,
                              color: Colors.white,
                            ):null,
                          ),
                        ),

                        SizedBox(width: 12,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("By Creating an account, you agree to our",
                            style: regular16pt.copyWith(color: textGrey),
                            ),
                            Text("Terms & Conditions",
                              style: regular16pt.copyWith(color: primaryBlue),
                            )
                          ],
                        )
                      ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 64,),
                CustomPrimaryButton(buttonColor: primaryBlue, textValue: 'Register', textColor: Colors.white, onPressed: (){

                }),
                SizedBox(height: 24,),


                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                      style: regular16pt.copyWith(color: textGrey),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text("Login",
                        style: regular16pt.copyWith(color: primaryBlue),
                      ),
                    )
                  ],
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}