import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';


class ProductImageSliderModule extends StatelessWidget {
  ProductImageSliderModule({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: CarouselSlider.builder(
        itemCount:
            productDetailsScreenController.productDetailLists[0].images.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = ApiUrl.ApiMainPath +
              productDetailsScreenController
                  .productDetailLists[0].images[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("$imgUrl"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: Get.height * 0.35,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) =>
              productDetailsScreenController.activeIndex.value = index,
        ),
      ),
    );
  }
}

class ProductImageSliderIndicatorModule extends StatelessWidget {
  ProductImageSliderIndicatorModule({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          productDetailsScreenController.productDetailLists[0].images.length,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: productDetailsScreenController.activeIndex.value == index
                  ? AppColors.colorDarkPink
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsModule extends StatelessWidget {
  ProductDetailsModule({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${productDetailsScreenController.productDetailLists[0].productname}",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await productDetailsScreenController.addProductWishlistFunction(
                      productDetailsScreenController.productDetailLists[0].id
                  );
                },
                  child: Image.asset(Images.ic_heart, scale: 15),
              ),
            ],
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: index == 0
                                    ? Colors.blue
                                    : index == 1
                                        ? Colors.deepPurple
                                        : index == 2
                                            ? Colors.grey
                                            : index == 3
                                                ? Colors.red
                                                : Colors.white),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: index == 0
                                  ? Text("M")
                                  : index == 1
                                      ? Text("S")
                                      : index == 2
                                          ? Text("XL")
                                          : index == 3
                                              ? Text("L")
                                              : Container(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Product Description",
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "${productDetailsScreenController.productDetailLists[0].fullText}",
            style: TextStyle(fontSize: 19, color: Colors.black),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              productDetailsScreenController.productAddToCart();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.colorDarkPink),
              child: Center(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
