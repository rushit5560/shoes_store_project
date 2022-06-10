import 'package:get/get.dart';

import '../../common/images.dart';

class CheckOutScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isSelectedIndex = 0.obs;

  List<CheckOutPaymentModel> paymentMethodList = [
    CheckOutPaymentModel(
        img: Images.mastercard,
        name: 'Master Card'
    ),
    CheckOutPaymentModel(
        img: Images.paypal,
        name: 'Paypal'
    ),
    CheckOutPaymentModel(
        img: Images.visa,
        name: 'Visa Card'
    ),
    CheckOutPaymentModel(
        img: Images.cod,
        name: 'Cash On Delivery'
    ),
  ];

}


class CheckOutPaymentModel{
  String img;
  String name;
  CheckOutPaymentModel({required this.img, required this.name});
}