import 'package:bank_app/pages/controllers/profile_controller.dart';
import 'package:bank_app/pages/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    final email = TextEditingController(text: userData.email);
                    final fullName =
                        TextEditingController(text: userData.fullName);
                    final phoneNo =
                        TextEditingController(text: userData.phoneNo);
                    return Column(
                      children: [
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
                                  Icons.camera_alt,
                                  color: Color(0xffff735c),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Divider(
                          color: Color(0xffff735c),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            child: Column(
                          children: [
                            TextFormField(
                              controller: fullName,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                prefixIconColor: Color(0xffff735c),
                                labelText: 'Full Name',
                                labelStyle: TextStyle(color: Color(0xffff735c)),
                                hintText: 'Full Name',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffff735c)),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              cursorColor: Color(0xffff735c),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                prefixIconColor: Color(0xffff735c),
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Color(0xffff735c)),
                                hintText: 'E-mail',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffff735c)),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              cursorColor: Color(0xffff735c),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: phoneNo,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                prefixIconColor: Color(0xffff735c),
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(color: Color(0xffff735c)),
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffff735c)),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              keyboardType: TextInputType.phone,
                              cursorColor: Color(0xffff735c),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final user = UserModel(
                                        email: email.text.trim(),
                                        fullName: fullName.text.trim(),
                                        phoneNo: phoneNo.text.trim());

                                    await controller.updateData(user);
                                  },
                                  child: Text(
                                    "Edit Profile",
                                    style: TextStyle(color: Color(0xffff735c)),
                                  )),
                            ),
                          ],
                        ))
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
          ),
        ),
      ),
    );
  }
}
