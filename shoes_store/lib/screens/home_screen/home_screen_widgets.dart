import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:shoes_store/models/home_screen_model/featured_product_model.dart';

class SearchTextFieldModule extends StatelessWidget {
  SearchTextFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          //controller: signInPasswordFieldController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(Icons.search_outlined),
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
}

class ImageBannerModule extends StatelessWidget {
  ImageBannerModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeScreenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            "${homeScreenController.bannerLists[index].imagePath}";
        return _imageModule(imgUrl);
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            homeScreenController.activeIndex.value = index;
          }),
    );
  }

  Widget _imageModule(String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage("$imgUrl"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Running Mens Shoes',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBannerIndicator extends StatelessWidget {
  ImageBannerIndicator({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeScreenController.bannerLists.length,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: homeScreenController.activeIndex.value == index
                  ? AppColors.colorDarkPink
                  : Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class NewCollectionListModule extends StatelessWidget {
  NewCollectionListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Collections",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  //Get.to(()=> CategoryScreen());
                },
                child: Text(
                  "Show All",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10),
          Container(
            height: Get.height * 0.25,
            child: ListView.builder(
                itemCount: homeScreenController.featuredProductLists.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Datum1 featuredSingleItem= homeScreenController.featuredProductLists[index];
                  final imgUrl = ApiUrl.ApiMainPath + "${featuredSingleItem.showimg}";
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          //height: 100,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade200,
                              //border: Border.all(color: Colors.grey.shade400
                              //),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400, blurRadius: 5)
                              ]),
                          child: Image.network("$imgUrl"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${featuredSingleItem.productname}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "\$${featuredSingleItem.productcost}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "\$${featuredSingleItem.productcost}",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class BestSellerListModule extends StatelessWidget {
  BestSellerListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Seller",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  //Get.to(()=> CategoryScreen());
                },
                child: Text(
                  "Show All",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: Get.height * 0.25,
            child: ListView.builder(
                itemCount: homeScreenController.featuredProductLists.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Datum1 featuredSingleItem= homeScreenController.featuredProductLists[index];
                  final imgUrl = ApiUrl.ApiMainPath + "${featuredSingleItem.showimg}";
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          //height: 100,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade200,
                              //border: Border.all(color: Colors.grey.shade400
                              //),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400, blurRadius: 5)
                              ]),
                          child: Image.network("$imgUrl"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${featuredSingleItem.productname}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "\$${featuredSingleItem.productcost}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "\$${featuredSingleItem.productcost}",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class OfferListModule extends StatelessWidget {
  OfferListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      child: ListView.builder(
          itemCount: homeScreenController.bannerLists.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Image.network(ApiUrl.ApiMainPath +
                        homeScreenController.bannerLists[index].imagePath),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "20% Off on Mens Shoes",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 35,
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.colorDarkPink),
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}