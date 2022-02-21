import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/cart_screen/cart_screen.dart';
import 'package:shoes_store/screens/category_collection_screen/filter_dialog.dart';
import 'app_colors.dart';

PreferredSizeWidget commonAppBarModule({required image, index = 0, context}) {
  return AppBar(
    leading: index == 1
        ? Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  Images.ic_drawer_menu,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          )
        : null,
    centerTitle: true,
    elevation: 0,
    title: index == 1
        ? Image.asset(
            Images.ic_logo,
            scale: 2,
          )
        : Text(
            "$image",
            style: TextStyle(color: Colors.white),
          ),
    backgroundColor: AppColors.colorDarkPink,
    actions: [
      index == 1
          ? GestureDetector(
              onTap: () => Get.to(() => CartScreen()),
              child: Image.asset(Images.ic_notification, height: 25, width: 25),
            )
          : index == 2
              ? GestureDetector(
                  onTap: () => print('Clk Scanner'),
                  child: Image.asset(Images.ic_notification,
                      height: 25, width: 25),
                )
              : index == 3
                  ? GestureDetector(
                      onTap: () {
                        Get.to(() => FilterDialog());
                      },
                      child: Icon(Icons.filter_list))
                  : index == 4
                      ? GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Icon(Icons.edit),
                        )
                      : Container(),
      SizedBox(width: 20)
    ],
  );
}

showAlertDialog(BuildContext context) {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  // set up the button
  Widget updateButton = Container(
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
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Edit Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: Colors.black,
        )
      ],
    ),
    content: Container(
      width: 260.0,
      height: Get.height / 1.6,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: new BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          userNameTextField(),
          const SizedBox(height: 20),
          addressTextField(),
          const SizedBox(height: 20),
          birthDateTextField(),
          const SizedBox(height: 20),

          /*Container(
               height: 50,
               child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                      RadioListTile(value: 1,
                     groupValue: editProfileController.selectedRadio.value,
                    title: Text("A"),
                    activeColor: Colors.teal,
                    onChanged: (int ? val){
                       // setState(() {
                       editProfileController.selectedRadio.value = val!;
                       //  });
                      }
                    ),



                      RadioListTile(value: 1,
                        groupValue: editProfileController.selectedRadio.value,
                        title: Text("A"),
                        activeColor: Colors.teal,
                        onChanged: (int ? val){
                          // setState(() {
                          editProfileController.selectedRadio.value = val!;
                          //  });
                        }
                    ),
                ],
               ),
             ),*/
          Obx(
            () => RadioListTile(
                value: 1,
                groupValue: editProfileController.male.value,
                title: Text("Male"),
                activeColor: Colors.teal,
                onChanged: (int? val) {
                  // setState(() {
                  editProfileController.male.value = val!;
                  //  });
                }),
          ),
          Obx(
            () => RadioListTile(
                value: 1,
                groupValue: editProfileController.female.value,
                title: Text("Female"),
                activeColor: Colors.teal,
                onChanged: (int? val) {
                  // setState(() {
                  editProfileController.female.value = val!;
                  //  });
                }),
          ),
          const SizedBox(height: 20),
          emailTextField(),
          const SizedBox(height: 20),
          aboutTextField()
        ],
      ),
    ),
    actions: [
      updateButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

userNameTextField() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0)]),
    child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //controller: signInPasswordFieldController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Username",
          //prefixIcon: Icon(icon, color: Colors.black),
          //isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        )

        //validator: (value) => FieldValidator().validatePassword(value!),

        ),
  );
}

addressTextField() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0)]),
    child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //controller: signInPasswordFieldController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Address",
          //prefixIcon: Icon(icon, color: Colors.black),
          //isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        )

        //validator: (value) => FieldValidator().validatePassword(value!),

        ),
  );
}

birthDateTextField() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0)]),
    child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //controller: signInPasswordFieldController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "BirthDate",
          //prefixIcon: Icon(icon, color: Colors.black),
          //isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        )

        //validator: (value) => FieldValidator().validatePassword(value!),

        ),
  );
}

emailTextField() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0)]),
    child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //controller: signInPasswordFieldController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Email Id",
          //prefixIcon: Icon(icon, color: Colors.black),
          //isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        )

        //validator: (value) => FieldValidator().validatePassword(value!),

        ),
  );
}

aboutTextField() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0)]),
    child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //controller: signInPasswordFieldController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "About",
          //prefixIcon: Icon(icon, color: Colors.black),
          //isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        )

        //validator: (value) => FieldValidator().validatePassword(value!),

        ),
  );
}

class EditProfileController extends GetxController {
  RxInt male = 1.obs;
  RxInt female = 2.obs;

//RangeValues _currentRangeValues =  (0-8000).obs;
}
