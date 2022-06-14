import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import '../../common/custom_appbar.dart';
import '../../common/field_validation.dart';
import '../../common/input_field_decoration.dart';
import '../../controllers/address_manager_screen_controller/user_billing_shipping_address_controller.dart';

class AddressManagerScreen extends StatelessWidget {
  // AddressManagerScreen({Key? key}) : super(key: key);

  final addressManagerScreenController = Get.put(AddressManagerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(image: "Addresses"),

      body: Obx(
        ()=> addressManagerScreenController.isLoading.value
            ?  Center(
          child: CircularProgressIndicator(
            color: AppColors.colorDarkPink,
            backgroundColor: Colors.grey,
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              shippingAddressFields(),
              SizedBox(height: 20),
              billingAddressFields(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }


  Widget shippingAddressFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Form(
        key: addressManagerScreenController.shippingKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Shipping Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.shippingAddressController,
              maxLines: 3,
              keyboardType: TextInputType.text,
              validator: (value) => FieldValidator().validateShippingAddress(value!),
              decoration: addressInputDecoration(hintText: "Shipping Address", radius: 25),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.shippingMobileController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value)=> FieldValidator().validateMobile(value!),
              decoration: addressInputDecoration(hintText: "Mobile Number", radius: 25),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.shippingEmailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value)=> FieldValidator().validateEmail(value!),
              decoration: addressInputDecoration(hintText: "Email", radius: 25),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () async {
                if(addressManagerScreenController.shippingKey.currentState!.validate()){
                  await addressManagerScreenController.getUserShippingAddress();
                }
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.colorDarkPink,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget billingAddressFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Form(
        key: addressManagerScreenController.billingKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing Address',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.billingAddressController,
              maxLines: 3,
              keyboardType: TextInputType.text,
              validator: (value)=> FieldValidator().validateBillingAddress(value!),
              decoration: addressInputDecoration(hintText: "Billing Address", radius: 25),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.billingMobileController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value){
                if(value!.isEmpty){
                  return "Mobile No. should not be Empty";
                }
                if(value.length > 10 || value.length < 10){
                  return "Mobile No. Should be 10 Digit.";
                }
                return null;
              },
              decoration: addressInputDecoration(hintText: "Mobile Number", radius: 25),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: addressManagerScreenController.billingEmailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value!.isEmpty){
                  return "Email should not be empty";
                }
                if(!value.contains('@')){
                  return "Email should be valid.";
                }
                return null;
              },
              decoration: addressInputDecoration(hintText: "Email", radius: 25),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () async {
                if(addressManagerScreenController.billingKey.currentState!.validate()){
                  await addressManagerScreenController.getUserBillingAddress();
                }
              },
              child: Container(
                // width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.colorDarkPink,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
