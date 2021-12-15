import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';

class CategoryDetailScreenController extends GetxController{
  var activeIndex = 0.obs;

  List<String> category=[
    Images.ic_shoes1,
    Images.ic_shoes2,
    Images.ic_shoes3,
    Images.ic_shoes4,
    Images.ic_shoes5,
    Images.ic_shoes6
  ];
}