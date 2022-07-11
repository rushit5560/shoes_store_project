import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/common/field_validation.dart';
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

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return Obx(
              () => profileScreenController.isLoading.value
                  ? CustomCircularProgressIndicator()
                  : AlertDialog(
                      content: Form(
                        key: profileScreenController.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EditProfileTextModule(),
                            const SizedBox(height: 10),
                            FullNameTextField(),
                            const SizedBox(height: 8),
                            CountryDropDownModule(),
                            const SizedBox(height: 8),
                            StateDropDownModule(),
                            const SizedBox(height: 8),
                            CityDropDownModule(),
                            const SizedBox(height: 20),
                            UpdateButton(),
                          ],
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
        Container(height: 1, color: Colors.black),
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
          // borderRadius: BorderRadius.circular(35),
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
          // borderRadius: BorderRadius.circular(35),
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
          // borderRadius: BorderRadius.circular(35),
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
      onTap: () {
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
            profileScreenController.updateProfileData(
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
