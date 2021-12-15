import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';

class BannerModel{
  BannerModel({
    required this.image,
    required this.name,
  });

  String image;
  String name;

}

class HomeScreenController extends GetxController{
  var activeIndex = 0.obs;
  List<BannerModel> banner = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBannerList();
  }

  getBannerList(){
    banner.add(
      BannerModel(
        image: Images.ic_banner1,
        name: 'Running Mens Shoes',
      ),
    );
    banner.add(
      BannerModel(
        image: Images.ic_banner2,
        name: 'Running Mens Shoes',
      ),
    );
    banner.add(
      BannerModel(
        image: Images.ic_banner1,
        name: 'Running Mens Shoes',
      ),
    );
    banner.add(
      BannerModel(
        image: Images.ic_banner2,
        name: 'Running Mens Shoes',
      ),
    );
  }

    List<String> image = [
      Images.ic_shoes1,
      Images.ic_shoes2,
      Images.ic_shoes3,
      Images.ic_shoes4,
      Images.ic_shoes5,
      Images.ic_shoes6

    ];

}