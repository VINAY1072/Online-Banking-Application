import 'package:bank_app/base_screen.dart';
import 'package:bank_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
// import 'home_pages/home.dart';
import '../utils.dart';

class Scene extends StatefulWidget {
  const Scene({super.key});

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  bool _obsText = true;
  var _pass = TextEditingController();

  @override
  void initState() {
    super.initState();

    _obsText = true;
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 176,
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
                        'Login to Account',
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
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
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
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Password';
                            }
                            return null;
                          },
                          obscureText: _obsText,
                          controller: _pass,
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
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        padding: EdgeInsets.all(30.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Select!",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Select an option to send a message to Email or Phone Number",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        Colors.grey.shade200),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mail_outline_rounded,
                                                      size: 60,
                                                      color: Color(0xffff735c),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'E-Mail',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Reset via E-Mail verification',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        Colors.grey.shade200),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mobile_friendly_rounded,
                                                      size: 60,
                                                      color: Color(0xffff735c),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Phone Number',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Reset via Phone Number verification',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(color: Color(0xffff735c)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Base()));
                            },
                            child: Text(
                              'LOG IN',
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
                              height: 10,
                            ),
                            Text('OR'),
                            SizedBox(
                              height: 10,
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
                                          builder: (context) => Signup()));
                                },
                                child: Text.rich(TextSpan(
                                  text: "Don't have an Account?",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 79, 78, 78)),
                                  children: [
                                    TextSpan(
                                      text: " SIGNUP",
                                      style:
                                          TextStyle(color: Color(0xffff735c)),
                                    )
                                  ],
                                )))
                          ],
                        )
                      ],
                    ),
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}
