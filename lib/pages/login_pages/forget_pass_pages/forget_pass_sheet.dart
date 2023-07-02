import 'package:bank_app/pages/login_pages/forget_pass_pages/forget_pass_mail.dart';
import 'package:flutter/material.dart';

class PassFor extends StatefulWidget {
  const PassFor({super.key});

  @override
  State<PassFor> createState() => _PassForState();
}

class _PassForState extends State<PassFor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select!",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Select below option to send a message to Email",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ForPassMail()));
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
              child: Row(
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    size: 60,
                    color: Color(0xffff735c),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-Mail',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
