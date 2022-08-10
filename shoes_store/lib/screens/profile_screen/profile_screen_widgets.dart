import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:shoes_store/models/profile_screen_model/city_model.dart';
import 'package:shoes_store/models/profile_screen_model/state_model.dart';
import 'package:shoes_store/models/profile_screen_model/country_model.dart';

PreferredSizeWidget profileScreenAppBarModule(
    {required String title, required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(
      "$title",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: AppColors.colorDarkPink,
    actions: [
      GestureDetector(
        onTap: () {
          editProfileDialogModule(context);
        },
        child: Icon(Icons.edit),
      ),
      SizedBox(width: 20)
    ],
  );
}

editProfileDialogModule(BuildContext context) {
  final profileScreenController = Get.find<ProfileScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        final image = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          profileScreenController.file = File(image.path);
                          profileScreenController.loading();
                        } else {}
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      final image = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (image != null) {
                        profileScreenController.file = File(image.path);
                        profileScreenController.loading();
                      } else {}
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return Obx(
              () => profileScreenController.isLoading.value
                  ? CustomCircularProgressIndicator()
                  : AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      content: Form(
                        key: profileScreenController.formKey,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              EditProfileTextModule(),
                              const SizedBox(height: 10),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  profileScreenController.file != null
                                      ? GestureDetector(
                                          onTap: () {
                                            _showPicker(context);
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            child: Image.file(
                                              profileScreenController.file!,
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : profileScreenController.userProfile !=
                                              null
                                          ? GestureDetector(
                                              onTap: () {
                                                _showPicker(context);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(80.0),
                                                child: Image.network(
                                                  "${ApiUrl.ApiMainPath}${profileScreenController.userProfile}",
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (ctx, ibj, st) {
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(100),
                                                      ),
                                                      child: Image.asset(
                                                        Images.noImage,
                                                        height: 120,
                                                        width: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                _showPicker(context);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(80.0),
                                                child: Image.asset(
                                                  Images.noImage,
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                  GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin:
                                          EdgeInsets.only(bottom: 8, right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColors.colorDarkPink),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              FullNameTextField(),
                              const SizedBox(height: 12),
                              CountryDropDownModule(),
                              const SizedBox(height: 12),
                              profileScreenController.stateLists.length == 1
                                  ? SizedBox()
                                  : StateDropDownModule(),
                              const SizedBox(height: 12),
                              profileScreenController.cityLists.length == 2
                                  ? SizedBox()
                                  : CityDropDownModule(),
                              profileScreenController.cityLists.length == 2
                                  ? SizedBox()
                                  : SizedBox(height: 28),
                              UpdateButton(),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        );
      });
}

class EditProfileTextModule extends StatelessWidget {
  const EditProfileTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(height: 0.5, color: Colors.black),
        SizedBox(height: 10),
      ],
    );
  }
}

class FullNameTextField extends StatelessWidget {
  FullNameTextField({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 25.0,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: profileScreenController.fullNameController,
        decoration: formInputDecoration(hintText: 'UserName'),
        validator: (value) => FieldValidator().validateFullName(value!),
      ),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: profileScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.countryDropDownValue!.name = newValue!.name;
            profileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${profileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            profileScreenController.stateLists.clear();
            profileScreenController.getStateData(newValue.id);
          },
          items: profileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StateDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: profileScreenController.stateDropDownValue,
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.stateDropDownValue!.name = newValue!.name;
            profileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${profileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.cityLists.clear();
            profileScreenController.getCityData(newValue.id);
            profileScreenController.loading();
          },
          items: profileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: profileScreenController.cityDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.cityDropDownValue!.name = newValue!.name;
            profileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${profileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.loading();
          },
          items: profileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  UpdateButton({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (profileScreenController.formKey.currentState!.validate()) {
          if (profileScreenController.countryDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select Country', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.stateDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select State', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.cityDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select City', toastLength: Toast.LENGTH_LONG);
          } else {
            await profileScreenController.updateProfileData(
              "${profileScreenController.fullNameController.text.trim()}",
            );
          }
        }
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Update",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
