// import 'package:bank_app/pages/home_pages/home.dart';
import 'package:bank_app/pages/login_pages/login_page.dart';
import 'package:bank_app/pages/controllers/controller.dart';
import 'package:bank_app/pages/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base_screen.dart';
import '../../utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obsText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obsText = true;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
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
                    width: 167,
                    height: 167,
                    child: Image.asset(
                      'images/-yH8.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        'Create your Account',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          // height: 1.2175,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.fullName,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Color(0xffff735c),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: Color(0xffff735c)),
                            hintText: 'Full Name',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffff735c))),
                          ),
                          cursorColor: Color(0xffff735c),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            prefixIconColor: Color(0xffff735c),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Color(0xffff735c)),
                            hintText: 'E-mail',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffff735c))),
                          ),
                          cursorColor: Color(0xffff735c),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.phoneNo,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            prefixIconColor: Color(0xffff735c),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Color(0xffff735c)),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffff735c))),
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: Color(0xffff735c),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Password';
                            }
                            return null;
                          },
                          obscureText: _obsText,
                          controller: controller.password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            prefixIconColor: Color(0xffff735c),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsText = !_obsText;
                                });
                              },
                              child: Icon(_obsText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color(0xffff735c)),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffff735c))),
                          ),
                          cursorColor: Color(0xffff735c),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                // 1

                                // 2
                                final user = UserModel(
                                    email: controller.email.text.trim(),
                                    fullName: controller.fullName.text.trim(),
                                    phoneNo: controller.phoneNo.text.trim());
                                SignUpController.instance.createUser(user);
                                SignUpController.instance.registerUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                                controller.email.clear();
                                controller.password.clear();
                                controller.fullName.clear();
                                controller.phoneNo.clear();
                              }
                            },
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(color: Color(0xffff735c)),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('OR'),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                label: Text(
                                  'Sign In with Google',
                                  style: TextStyle(color: Color(0xffff735c)),
                                ),
                                icon: Image(
                                  image: AssetImage('images/google.png'),
                                  width: 20,
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scene()));
                                },
                                child: Text.rich(TextSpan(
                                  text: "Already have an Account?",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 79, 78, 78)),
                                  children: [
                                    TextSpan(
                                      text: " LOGIN",
                                      style:
                                          TextStyle(color: Color(0xffff735c)),
                                    )
                                  ],
                                )))
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
