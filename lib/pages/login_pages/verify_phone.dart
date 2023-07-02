import 'package:bank_app/pages/controllers/otp_contoller.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyVerifyPhone extends StatefulWidget {
  const MyVerifyPhone({Key? key}) : super(key: key);

  @override
  State<MyVerifyPhone> createState() => _MyVerifyPhoneState();
}

class _MyVerifyPhoneState extends State<MyVerifyPhone> {
  @override
  Widget build(BuildContext context) {
    var code = "";
    var otp;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/forg_pass.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter OTP which was sent to your account Phone Number!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  code = value;
                  otp = code;
                  OtpController.instance.verifyOtp(otp);
                },
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      OtpController.instance.verifyOtp(otp);
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
