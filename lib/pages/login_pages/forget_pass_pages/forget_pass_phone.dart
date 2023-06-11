import 'package:bank_app/pages/login_pages/forget_pass_pages/verify_phone.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

class ForPassPhone extends StatefulWidget {
  const ForPassPhone({super.key});

  @override
  State<ForPassPhone> createState() => _ForPassPhoneState();
}

class _ForPassPhoneState extends State<ForPassPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 132, 30, 27.5),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // 5JE (312:4)
                    width: 176,
                    height: 176,
                    child: Image.asset(
                      'images/forg_pass.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Forget Password',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              // height: 1.2175,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            'Type your account Phone Number to reset the password',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              // height: 1.2175,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            prefixIconColor: Colors.black,
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                          cursorColor: Colors.black,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyVerifyPhone()));
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
