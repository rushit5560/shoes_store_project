import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_drawer/custom_drawer.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/home_screen_controller/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: Image.asset(Images.ic_logo), index: 1),

      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              searchTextField(),
              SizedBox(height: 20,),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        banner(),
                        carouselIndicator(),
                      ],
                    ),
                    SizedBox(height: 20,),
                    newCollectionList(),

                    SizedBox(height: 20,),
                    bestSellerList(),

                    SizedBox(height: 25,),
                    offerList(),
                    SizedBox(height: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  searchTextField(){
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
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
          )

        //validator: (value) => FieldValidator().validatePassword(value!),

      ),
    );
  }

  banner(){
    return CarouselSlider.builder(
      itemCount: homeScreenController.banner.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(homeScreenController.banner[index].image),
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
                      flex:1,
                      child: Text(
                        homeScreenController.banner[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            ],
          ),
        );
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

  carouselIndicator(){
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4, (index) => Container(
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

  newCollectionList(){
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Collections",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),

              GestureDetector(
                onTap: () {
                  //Get.to(()=> CategoryScreen());
                },
                child: Text("Show All",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20, decoration: TextDecoration.underline),),
              )
            ],
          ),

          SizedBox(height: 10,),
          Container(
            height: Get.height * 0.25,
            child: ListView.builder(
                itemCount: homeScreenController.image.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
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
                                color: Colors.grey.shade400,
                                blurRadius: 5
                              )
                            ]
                          ),
                          child: Image.asset(homeScreenController.image[index],),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Men's Shoes",
                        style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("\$200",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500
                            ),),
                          SizedBox(width: 10,),
                          Text("\$200",
                            style: TextStyle(
                                 fontSize: 18
                            ),)
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

  bestSellerList(){
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best Seller",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),

              GestureDetector(
                onTap: () {
                  //Get.to(()=> CategoryScreen());
                },
                child: Text("Show All",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20, decoration: TextDecoration.underline),),
              )
            ],
          ),

          SizedBox(height: 10,),
          Container(
            height: Get.height * 0.25,
            child: ListView.builder(
                itemCount: homeScreenController.image.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
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
                                    color: Colors.grey.shade400,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Image.asset(homeScreenController.image[index],),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Men's Shoes",
                        style: TextStyle(
                            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("\$200",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500
                            ),),
                          SizedBox(width: 10,),
                          Text("\$200",
                            style: TextStyle(
                                fontSize: 18
                            ),)
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

  offerList(){
    return Container(
     height: Get.height * 0.25,
      child: ListView.builder(
          itemCount: homeScreenController.banner.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
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
                    child: Image.asset(homeScreenController.banner[index].image),
                  ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("20% Off on Mens Shoes", maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10,),

                    Container(
                      height: 35, width: Get.width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.colorDarkPink
                      ),
                      child: Center(
                          child: Text("Shop Now", style: TextStyle(color: Colors.white, fontSize: 17),)),
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
