// import 'dart:html';
import 'dart:io';
import 'package:bank_app/pages/controllers/profile_controller.dart';
import 'package:bank_app/pages/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profilepic_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageSelected;
  ImagePicker _picker = ImagePicker();
  PicController picController = Get.find();
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
                            Obx(() => CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      picController.isPathSet.value == true
                                          ? FileImage(File(picController
                                              .profpicpath
                                              .value)) as ImageProvider
                                          : AssetImage('images/bank_logo.png'),
                                )),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Color(0xffff735c),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) =>
                                              bottomsheet()));
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
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

  Future<void> takePhoto(ImageSource source) async {
    final PickedFile =
        await _picker.pickImage(source: source, imageQuality: 100);

    imageSelected = File(PickedFile!.path);
    picController.setprofimagepath(imageSelected!.path);

    Get.back();
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Color(0xffff735c),
                ),
                label:
                    Text('Camera', style: TextStyle(color: Color(0xffff735c))),
              ),
              SizedBox(
                width: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Color(0xffff735c),
                ),
                label:
                    Text('Gallery', style: TextStyle(color: Color(0xffff735c))),
              )
            ],
          )
        ],
      ),
    );
  }
}
