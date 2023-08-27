import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../theme.dart';
import '../widgets/primary_button.dart';

class OtpVerificationScreen extends StatefulWidget {

  const OtpVerificationScreen({
    Key? key,

  }) : super(key: key);

  @override
  _VerifyTokenState createState() => _VerifyTokenState();
}

class _VerifyTokenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  String otp = "";
  bool canResend = false;
  Timer? _timer;
  int _countdown = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    print("dscsdc");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          canResend = true;
          _timer?.cancel();
        }
      });
    });
  }



  void resendLink() {
    if (canResend) {
      // TODO: Implement the logic to resend the link
      print('Resending link...');
      // Reset the countdown
      setState(() {
        _countdown = 30;
        canResend = false;
      });
      // Start the timer again
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OTP Verification",
                      style: heading2.copyWith(color: textBlack),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/accent.png',
                      width: 99,
                      height: 4,
                    )
                  ],
                ),

                const SizedBox(
                  height: 60,
                ),
                OTPTextField(
                  fieldWidth:50,
                  fieldStyle:FieldStyle.box,
                  length: 6,
                  keyboardType: TextInputType.number,
                  width: MediaQuery.of(context).size.width,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                 // fieldStyle: FieldStyle.underline,
                  onChanged: (pin) {
                    otp = pin;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     '00:${ _countdown.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Didn't receive otp?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        canResend
                            ? InkWell(
                            onTap:  (){
                              resendLink();
                            },
                            child: const Text(" Resend"))
                            : const Text(
                          " Resend",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomPrimaryButton(
                    buttonColor: primaryBlue,
                    textValue: 'Verify OTP',
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const OtpVerificationScreen()));
                    }),
              ],
            ),
          ),
        ),
      )



    );
  }


}