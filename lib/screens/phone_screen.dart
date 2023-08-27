import 'package:auth_ui_tutorial/screens/register_screen.dart';
import 'package:auth_ui_tutorial/theme.dart';
import 'package:auth_ui_tutorial/widgets/input_field.dart';
import 'package:auth_ui_tutorial/widgets/primary_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'new_password.dart';
import 'otp_verification_screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

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
                    "Enter Your Phone \nNumber",
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/accent.png',
                    width: 99,
                    height: 4,
                  ),

              SizedBox(
                height: 48,
              ),
              Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'IT',
                    favorite: ['+39','FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    flagWidth: 12,

                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.64,
                    child: InputField(
                      keyBoardType: TextInputType.number,

                        hintText: 'Phone Number',
                        suffixIcon: SizedBox(),
                        controller: phoneController),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Send Code',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const OtpVerificationScreen()));
                  }),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
