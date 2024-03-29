import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/field_validation.dart';
import '../../common/input_field_decoration.dart';
import '../../controllers/checkout_screen_controller/checkout_screen_controller.dart';
import '../../models/profile_screen_model/country_model.dart';

class BillingDetailsModule extends StatelessWidget {
  BillingDetailsModule({Key? key}) : super(key: key);
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInScreenController.checkoutFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(child: FirstNameTextField()),
              const SizedBox(width: 10),
              Expanded(child: LastNameTextField()),
            ],
          ),
          const SizedBox(height: 10),
          CompanyNameTextField(),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: CountryDropDownModule()),
              const SizedBox(width: 10),
              Expanded(child: AddressTextField()),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: CityTextField()),
              const SizedBox(width: 10),
              Expanded(child: StateTextField()),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: PhoneNoTextField()),
              const SizedBox(width: 10),
              Expanded(child: EmailTextField()),
            ],
          ),

          const SizedBox(height: 10),
          OrderNoteTextField(),

          // const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class FirstNameTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.firstNameFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'First Name', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateFirstName(value!),
    );
  }
}

class LastNameTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.lastNameFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'Last Name', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateLastName(value!),
    );
  }
}

class CompanyNameTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.companyNameFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'Company Name', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateCompanyName(value!),
    );
  }
}

class AddressTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.streetAddressFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'Address', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateAddress(value!),
    );
  }
}

class CityTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.cityFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'City', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateCity(value!),
    );
  }
}

class StateTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.stateFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'State', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateState(value!),
    );
  }
}

class PhoneNoTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.phoneNoFieldController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      decoration: formInputDecoration(
        hintText: 'Phone No',
        radius: 30,
      ),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.emailIdFieldController,
      keyboardType: TextInputType.emailAddress,
      decoration: formInputDecoration(hintText: 'Email', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class OrderNoteTextField extends StatelessWidget {
  final signInScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.orderNoteFieldController,
      keyboardType: TextInputType.text,
      decoration: formInputDecoration(hintText: 'Order Note', radius: 30),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateOrderNote(value!),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final checkOutScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        width: Get.width,
        // height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: checkOutScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          style: TextStyle(color: Colors.black87),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            checkOutScreenController.countryDropDownValue = newValue!;
            checkOutScreenController.loadUI();
          },
          items: checkOutScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(
                value.name,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
