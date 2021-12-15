import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/cart_screen/cart_screen.dart';
import 'package:shoes_store/screens/category_details_screen/category_detail_screen_controller.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryDetailScreen({Key? key}) : super(key: key);

  CategoryDetailScreenController categoryScreenDetailScreenController =
      Get.put(CategoryDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Shop detail", index: 3, context: context),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              detailImage(),
              carouselIndicator(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: productDetails(),
            ),
          )
        ],
      ),
    );
  }

  detailImage() {
    return Container(
      height: Get.height / 2.7,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      categoryScreenDetailScreenController.category[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              categoryScreenDetailScreenController.activeIndex.value = index;
            }),
      ),
    );
  }

  carouselIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: categoryScreenDetailScreenController.activeIndex.value ==
                      index
                  ? AppColors.colorDarkPink
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  productDetails() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bots Casual Shoes",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                Images.ic_heart,
                scale: 15,
              )
            ],
          ),

          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
           // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                            height: 30, width: 30,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: index ==0 ? Colors.blue : index == 1?
                                  Colors.deepPurple : index ==2 ?
                                  Colors.grey : index == 3? Colors.red : Colors.white
                            ),
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
                    Text("Size", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                            height: 30, width: 30,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:  Colors.white,
                              border: Border.all(color: Colors.black)
                            ),
                            child: Center(
                              child: index ==0 ? Text("M"): index == 1 ?
                              Text("S") : index ==2 ? Text("XL"): index == 3? Text("L"): Container(),
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

          SizedBox(height: 10,),

          Text("Product Description",
            style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
            style: TextStyle(
                fontSize: 19,
                color: Colors.black,
            ),),

          SizedBox(height: 10,),
          
          GestureDetector(
            onTap: (){
              Get.to(()=> CartScreen());
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.colorDarkPink
              ),
              child: Center(
                child: Text("Add To Cart", style: TextStyle(
                  color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
