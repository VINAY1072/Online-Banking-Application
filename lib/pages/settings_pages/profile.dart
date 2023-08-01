import 'package:bank_app/pages/settings_pages/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/controller.dart';
import '../login_pages/login_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage("images/bank_logo.png"),
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.edit,
                        color: Color(0xffff735c),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Vinay P",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "vinay.parampalli@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfile()));
                    },
                    child: Text("Edit Profile")),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Color(0xffff735c),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileMenu(
                  title: "Settings",
                  icon: Icons.settings,
                  onPress: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SettingsPage()));
                  }),
              ProfileMenu(
                  title: "User Management",
                  icon: Icons.verified_user,
                  onPress: () {}),
              ProfileMenu(
                  title: "Information", icon: Icons.info, onPress: () {}),
              Divider(
                color: Color(0xffff735c),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileMenu(
                  title: "Contact Us",
                  icon: Icons.contact_emergency,
                  onPress: () {}),
              ProfileMenu(
                  title: "Logout",
                  icon: Icons.logout,
                  onPress: () {
                    SignUpController.instance.email.clear();
                    SignUpController.instance.fullName.clear();
                    SignUpController.instance.password.clear();
                    SignUpController.instance.phoneNo.clear();
                    SignUpController.instance.logoutUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Scene()));
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          icon,
          color: Color(0xffff735c),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 15,
        ),
      ),
    );
  }
}
