import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:shoes_store/models/home_screen_model/featured_product_model.dart';
import 'package:shoes_store/screens/product_details_screen/product_details_screen.dart';

import '../collection_screen/collection_screen.dart';

class SearchTextFieldModule extends StatelessWidget {
  SearchTextFieldModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: homeScreenController.searchFieldController,
        // obscureText: true,
        decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: GestureDetector(
            onTap: () {
              homeScreenController.searchFieldController.clear();
              Get.to(() => CollectionScreen());
            },
            child: Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
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
        ),
        cursorColor: AppColors.colorDarkPink,
        enableSuggestions: true,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (val) {
          homeScreenController.searchFieldController.clear();
          Get.to(() => CollectionScreen());
        },

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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: homeScreenController.bannerLists.length,
            itemBuilder: (context, index, realIndex) {
              final imgUrl = ApiUrl.ApiMainPath +
                  "${homeScreenController.bannerLists[index].imagePath}";
              return _imageModule(imgUrl, index);
            },
            options: CarouselOptions(
              height: 165,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                homeScreenController.activeIndex.value = index;
              },
            ),
          ),
          SizedBox(height: 8),
          ImageBannerIndicator(),
        ],
      ),
    );
  }

  Widget _imageModule(String imgUrl, int index) {
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
                    homeScreenController.bannerLists[index].title,
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

/*class BrandBannerModule extends StatelessWidget {
  BrandBannerModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: homeScreenController.brandBannerList.length,
            itemBuilder: (context, index, realIndex) {
              final imgUrl = ApiUrl.ApiMainPath +
                  "${homeScreenController.brandBannerList[index].brandImage}";
              return _imageModule(imgUrl, index);
            },
            options: CarouselOptions(
                height: 165,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                onPageChanged: (index, reason) {
                  homeScreenController.activeIndex.value = index;
                }),
          ),
          // SizedBox(height: 8),
          // ImageBannerIndicator(),
        ],
      ),
    );
  }

  Widget _imageModule(String imgUrl, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.80),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage("$imgUrl"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}*/

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
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: homeScreenController.activeIndex.value == index
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
                "Featured Product",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => CollectionScreen());
                },
                child: Text(
                  "Show All",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.to(()=> CollectionScreen());
              //   },
              //   child: Text(
              //     "Show All",
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w500,
              //         fontSize: 20,
              //         decoration: TextDecoration.underline),
              //   ),
              // )
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: Get.height * 0.22,
            child: ListView.separated(
                itemCount: homeScreenController.featuredProductLists.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (ctx, ind) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (context, index) {
                  Datum1 featuredSingleItem =
                      homeScreenController.featuredProductLists[index];
                  final imgUrl =
                      ApiUrl.ApiMainPath + "${featuredSingleItem.showimg}";
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailsScreen(),
                        arguments: featuredSingleItem.id,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              //height: 100,
                              // margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade200,
                                //border: Border.all(color: Colors.grey.shade400
                                //),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 5)
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network("$imgUrl"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${featuredSingleItem.productname}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "\$${featuredSingleItem.productcost}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              // const SizedBox(width: 10),
                              // Text(
                              //   "\$${featuredSingleItem.totalcost}",
                              //   style: TextStyle(fontSize: 18),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
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
                  Get.to(() => CollectionScreen());
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
                  Datum1 featuredSingleItem =
                      homeScreenController.featuredProductLists[index];
                  final imgUrl =
                      ApiUrl.ApiMainPath + "${featuredSingleItem.showimg}";
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailsScreen(),
                        arguments: featuredSingleItem.id,
                      );
                    },
                    child: Column(
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
                                      color: Colors.grey.shade400,
                                      blurRadius: 5)
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
                              "\$${featuredSingleItem.totalcost}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "\$${featuredSingleItem.totalcost}",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
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
      height: Get.height * 0.20,
      child: ListView.builder(
          physics: PageScrollPhysics(),
          itemCount: homeScreenController.bannerLists.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String imgUrl = ApiUrl.ApiMainPath +
                "${homeScreenController.bannerLists[index].imagePath}";
            return _offerListTile(imgUrl);
          }),
    );
  }

  Widget _offerListTile(String imgUrl) {
    print('imgUrl : $imgUrl');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: Get.width * 0.95,
              height: Get.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey,
              ),
              child: Image.network(
                "$imgUrl",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "20% Off on Mens Shoes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    // height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.colorDarkPink,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        "Shop Now",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialModule extends StatelessWidget {
  TestimonialModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Testimonials",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          CarouselSlider.builder(
            itemCount: homeScreenController.testimonialLists.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade400,
                    // boxShadow: [
                    //   BoxShadow(color: Colors.grey.shade400, blurRadius: 5)
                    // ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiUrl.ApiMainPath}${homeScreenController.testimonialLists[index].showimg}'),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          homeScreenController.testimonialLists[index].name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Html(
                            data: homeScreenController
                                .testimonialLists[index].description,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
                // height: 200,
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 1.6,
                onPageChanged: (index, reason) {
                  // bannerController.activeIndex.value = index;
                }),
          ),
        ],
      ),
    );
  }
}
