import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/screens/index_screen/index_screen.dart';
import 'package:shoes_store/controllers/onboarding_screen_controller/onboarding_screen_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final onBoardingController = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.selectedPageIndex,
              itemCount: onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onBoardingController
                          .onBoardingPages[index].imageAsset,
                        height: Get.height * 0.35,),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          onBoardingController.onBoardingPages[index].title,
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          onBoardingController.onBoardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: Row(
                children: List.generate(onBoardingController.onBoardingPages.length,
                      (index) => Obx(() => Container(
                    margin: EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: onBoardingController.selectedPageIndex.value == index ? Colors.orange : Colors.grey,
                        shape: BoxShape.circle
                    ),
                  ),
                  ),
                ),
              ),
            ),

            Positioned(
              right: 20,
              bottom: 25,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.orange,
                onPressed: onBoardingController.forwardAction,
                child: Obx(()=> Text(onBoardingController.isLastPage ? 'Start' : 'Next')),
              ),
            ),
          ],
        ),
      ),
    );*/

    return Scaffold(
      backgroundColor: AppColors.colorLightGrey,
      body: GestureDetector(
        onTap: () {
          if(onBoardingController.isLastPage){
            onBoardingController.setOnBoardingValue();
            onBoardingController.goToLoginScreen();
          }
        },
        onHorizontalDragStart: (DragStartDetails start){
          onBoardingController.goToLoginScreen();
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 10),
            height: Get.height/1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkPink
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                PageView.builder(
                  controller: onBoardingController.pageController,
                  onPageChanged: onBoardingController.selectedPageIndex,
                  itemCount: onBoardingController.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: Get.height/7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(onBoardingController
                              .onBoardingPages[index].imageAsset,
                            height: Get.height * 0.20,),
                          SizedBox(height: 20),
                          Text(
                            onBoardingController.onBoardingPages[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            onBoardingController.onBoardingPages[index].description,
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17, color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.off(() => IndexScreen());
                          //Get.off(page);
                        },
                        child: Container(
                          child: Text("Skip",
                            style: TextStyle(color: Colors.white),),
                        ),
                      ),

                      Row(
                        children: List.generate(onBoardingController.onBoardingPages.length,
                              (index) => Obx(() => Container(
                            margin: EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: onBoardingController.selectedPageIndex.value == index ? Colors.white : Colors.grey,
                                shape: BoxShape.circle
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
