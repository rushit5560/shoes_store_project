import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/category_screen/category_screen_controller.dart';
import 'package:shoes_store/screens/new_category_screen/new_category_screen.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key}) : super(key: key);

   CategoryScreenController categoryController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Category", index: 2),

      body: Column(
        children: [

          Expanded(
            child: categoryList(),
          ),
          Container()
        ],
      )

    );
  }

  categoryList(){
    return GestureDetector(
      onTap: (){
        Get.to(() => NewCategoryScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
            color: Colors.white
        ),
        child: ListView.builder(
          itemCount: categoryController.category.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 5,),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10
                                          )
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                            categoryController.category[index].image,
                                          ),fit: BoxFit.cover,),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(

                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            categoryController.category[index].name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                // color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            categoryController.category[index].item,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.black,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 27, width: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.colorDarkPink
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,size: 18,),
                            ),
                          ),
                          SizedBox(width: 5,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
