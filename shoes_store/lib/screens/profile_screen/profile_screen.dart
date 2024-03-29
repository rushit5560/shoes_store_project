import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:shoes_store/screens/profile_screen/profile_screen_widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileScreenController = Get.put(ProfileScreenController());

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: profileScreenAppBarModule(title: 'Profile', context: context),
      body: Obx(
        () => profileScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Container(height: 50),
                  profileContainer(context),
                ],
              ),
      ),
    );
  }

  profileContainer(context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Transform(
          transform: Matrix4.translationValues(0, -50, 0),
          child: Column(
            children: [
              profile(context),
              SizedBox(height: 10),
              profileName(),
              SizedBox(height: 15),
              Expanded(
                child: tabView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  profile(context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        profileScreenController.userProfile != null
            ? Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(80.0),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  child: Image.network(
                    "${ApiUrl.ApiMainPath}${profileScreenController.userProfile!}",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, obj, st) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(
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

                  // Image.file(
                  //   profileScreenController.file!,
                  //   height: 120,
                  //   width: 120,
                  //   fit: BoxFit.cover,
                  //   errorBuilder: (ctx, obj, st) {
                  //     return ClipRRect(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(100),
                  //       ),
                  //       child: Image.asset(
                  //         Images.noImage,
                  //         height: 120,
                  //         width: 120,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              )
            : Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(80.0),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  child: Image.asset(
                    Images.noImage,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        /*GestureDetector(
          onTap: () {
            _showPicker(context);
          },
          child: Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(right: 5,bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.colorDarkPink),
            child: Center(
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),*/
      ],
    );
  }

  profileName() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "${profileScreenController.userData.name}",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        // Container(
        //   child: Text("UAE"),
        // ),
      ],
    );
  }

  tabView() {
    return Column(
      children: [
        // mainTabsModule(),
        Divider(
          color: Colors.grey.shade300,
          height: 1,
          thickness: 0.5,
        ),
        SizedBox(height: 5),
        Expanded(
          child: Container(
            child: personalInfoModule(),
            // child: profileScreenController.isPersonalInfoSelected.value
            //     ? personalInfoModule()
            //     : myOrderModule(),
          ),
        ),
      ],
    );
  }

  /*mainTabsModule() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: GestureDetector(
                onTap: () {
                  profileScreenController.isPersonalInfoSelected.value = true;
                  profileScreenController.isOrderSelected.value = false;
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Center(
                    child: Text(
                      'Personal Info',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color:
                            profileScreenController.isPersonalInfoSelected.value
                                ? AppColors.colorDarkPink
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 20, left: 10),
          //     child: GestureDetector(
          //       onTap: () {
          //         profileScreenController.isPersonalInfoSelected.value = false;
          //         profileScreenController.isOrderSelected.value = true;
          //       },
          //       child: Padding(
          //         padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          //         child: Center(
          //           child: Text(
          //             'My Order',
          //             textScaleFactor: 1.1,
          //             style: TextStyle(
          //               color: profileScreenController.isOrderSelected.value
          //                   ? AppColors.colorDarkPink
          //                   : Colors.black,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
    // return Obx(
    //   () => Row(
    //     children: [
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 20, right: 10),
    //           child: GestureDetector(
    //             onTap: () {
    //               profileScreenController.isPersonalInfoSelected.value = true;
    //               profileScreenController.isOrderSelected.value = false;
    //             },
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
    //               child: Center(
    //                 child: Text(
    //                   'Personal Info',
    //                   textScaleFactor: 1.1,
    //                   style: TextStyle(
    //                     color:
    //                         profileScreenController.isPersonalInfoSelected.value
    //                             ? AppColors.colorDarkPink
    //                             : Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(right: 20, left: 10),
    //           child: GestureDetector(
    //             onTap: () {
    //               profileScreenController.isPersonalInfoSelected.value = false;
    //               profileScreenController.isOrderSelected.value = true;
    //             },
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
    //               child: Center(
    //                 child: Text(
    //                   'My Order',
    //                   textScaleFactor: 1.1,
    //                   style: TextStyle(
    //                     color: profileScreenController.isOrderSelected.value
    //                         ? AppColors.colorDarkPink
    //                         : Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }*/

  personalInfoModule() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birth Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '22/5/1998',
                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 60),
                Expanded(
                  //flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Male',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 20),*/
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email Id',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '${profileScreenController.userData.email}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade300,
              height: 1,
              thickness: 0.5,
            ),

            SizedBox(height: 20),
            Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'No Address is given.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  profileScreenController.userAddress.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'No Shipping Address is given.',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '${profileScreenController.userAddress}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  profileScreenController.userAddressMobileNo.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Contact information is not given.',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '${profileScreenController.userAddressMobileNo}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                ],
              ),
            ),

            /*Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, fontSize: 17
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${profileScreenController.countryDropDownValue!.name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),
                ),
              ],
            ),*/

            // SizedBox(height: 20),
            // Text(
            //   'About Us',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black, fontSize: 17
            //   ),
            // ),
            // SizedBox(height: 5,),
            // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
          ],
        ),
      ),
    );
  }

  myOrderModule() {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade500, blurRadius: 10)
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 10)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Images.ic_shoes1,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Men's Shoes",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.black,
                                          fontSize: 17),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'lorem ipsum dolor sit amet , consectetur',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '\$200',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.colorDarkPink,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '\$200',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.black,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

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
                      onTap: () {
                        gallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileScreenController.file = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        profileScreenController.file = File(image.path);
      });
    } else {}
  }
}
