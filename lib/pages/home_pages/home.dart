import 'dart:io';

import 'package:bank_app/pages/data_and_other_useful_pages/mycards.dart';
import 'package:bank_app/pages/home_pages/stats.dart';
import 'package:bank_app/pages/home_pages/trac.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/profile_controller.dart';
import '../controllers/profilepic_controller.dart';
import '../data_and_other_useful_pages/card_data.dart';
import '../models/user_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBalanceVisible = false;

  void toggleBalanceVisibility() {
    setState(() {
      isBalanceVisible = !isBalanceVisible;
    });
  }

  PicController picController = Get.find();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                return Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      "Hi, ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xffff735c)),
                    ),
                    Text(
                      userData.fullName,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins',
                          color: Color(0xffff735c)),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Obx(() => CircleAvatar(
                    radius: 70,
                    backgroundImage: picController.isPathSet.value == true
                        ? FileImage(File(picController.profpicpath.value))
                            as ImageProvider
                        : AssetImage('images/bank_logo.png'),
                  )),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 27,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 240,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return MyCard(card: myCards[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: myCards.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'ACCOUNT BALANCE',
                style: ApptextStyle.BODY_TEXT,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 6,
                        color: Colors.grey,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_balance_outlined,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: toggleBalanceVisibility,
                          child: Icon(
                            isBalanceVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Visibility(
                      visible: isBalanceVisible,
                      child: Text(
                        '\$10,000.00', // Replace with the actual account balance value
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'ACCOUNT STATS AND HISTORY',
                style: ApptextStyle.BODY_TEXT,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Stats()));
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                  color: Colors.grey,
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/stats.png', // Replace with the actual image path
                                width: 64,
                                height: 64,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Stats',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Transac()));
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                  color: Colors.grey,
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/transactions.png', // Replace with the actual image path
                                width: 64,
                                height: 64,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'History',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ApptextStyle {
  static const TextStyle MY_CARD_TITLE = TextStyle(
      color: Colors.amberAccent, fontWeight: FontWeight.w700, fontSize: 16);

  static const TextStyle MY_CARD_SUBTITLE =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

  static const TextStyle BODY_TEXT = TextStyle(
      color: Color(0xffff735c), fontWeight: FontWeight.w700, fontSize: 20);

  static const TextStyle LISTTILE_TITLE = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static const TextStyle LISTTILE_SUB_TITLE = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );
}
