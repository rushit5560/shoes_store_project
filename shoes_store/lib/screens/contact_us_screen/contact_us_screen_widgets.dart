import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/contact_us_screen_controller/contact_us_screen_controller.dart';

/*class GoogleMapModule extends StatelessWidget {
  GoogleMapModule({Key? key}) : super(key: key);
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      initialCameraPosition: _kGooglePlex,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}*/

class ContactUsAppBarModule extends StatelessWidget {
  const ContactUsAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            "Contact Us",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(),
        ],
      ),
    );
  }
}

class ContactUsForm extends StatelessWidget {
  ContactUsForm({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        // color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: contactUsScreenController.formKey,
          child: Column(
            children: [
              UsernameTextFieldModule(),
              const SizedBox(height: 20),
              EmailTextFieldModule(),
              const SizedBox(height: 20),
              PhoneNoTextFieldModule(),
              const SizedBox(height: 20),
              SubjectTextFieldModule(),
              const SizedBox(height: 20),
              CommentTextFieldModule(),
              const SizedBox(height: 35),
              SubmitButtonModule(),
            ],
          ),
        ),
      ),
    );
  }
}

class UsernameTextFieldModule extends StatelessWidget {
  UsernameTextFieldModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: contactUsScreenController.fullNameController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'User Name', radius: 30),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateUserName(value!),
      ),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: contactUsScreenController.emailIdController,
        keyboardType: TextInputType.emailAddress,
        decoration: formInputDecoration(hintText: 'Email Id', radius: 30),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateEmail(value!),
      ),
    );
  }
}

class PhoneNoTextFieldModule extends StatelessWidget {
  PhoneNoTextFieldModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: contactUsScreenController.phoneNoController,
        keyboardType: TextInputType.phone,
        decoration: formInputDecoration(hintText: 'Mobile No', radius: 30),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateMobile(value!),
      ),
    );
  }
}

class SubjectTextFieldModule extends StatelessWidget {
  SubjectTextFieldModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: contactUsScreenController.subjectController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'Subject', radius: 30),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateSubject(value!),
      ),
    );
  }
}

class CommentTextFieldModule extends StatelessWidget {
  CommentTextFieldModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: contactUsScreenController.commentController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'Comment', radius: 30),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateComment(value!),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (contactUsScreenController.formKey.currentState!.validate()) {
          contactUsScreenController.getContactUsData(
              fullName:
                  "${contactUsScreenController.fullNameController.text.trim()}",
              emailId:
                  "${contactUsScreenController.emailIdController.text.trim().toLowerCase()}",
              phoneNo:
                  "${contactUsScreenController.phoneNoController.text.trim()}",
              subject:
                  "${contactUsScreenController.subjectController.text.trim()}",
              comment:
                  "${contactUsScreenController.commentController.text.trim()}");
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
