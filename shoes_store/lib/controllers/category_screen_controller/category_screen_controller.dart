import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';

class CategoryModel{
  CategoryModel({
    required this.image,
    required this.name,
    required this.item
  });

  String image;
  String name;
  String item;

}

class CategoryScreenController extends GetxController{
  List<CategoryModel> category = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryList();
  }

  getCategoryList(){
    category.add(
      CategoryModel(
        image: Images.ic_shoes1,
        name: 'Mens Shoes',
        item: "3676 Items"
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_shoes2,
        name: 'Womens Shoes',
          item: "2076 Items"
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_shoes3,
        name: 'Kids Shoes',
          item: "1000 Items"
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_shoes4,
        name: 'New Arrivals',
          item: "1520 Items"
      ),
    );

    category.add(
      CategoryModel(
          image: Images.ic_shoes4,
          name: 'Special Shoes',
          item: "1520 Items"
      ),
    );
  }
}