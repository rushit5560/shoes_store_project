import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/category_details_screen/category_detail_screen.dart';
import 'package:shoes_store/controllers/new_category_screen_controller/new_category_screen_controller.dart';

class NewCategoryScreen extends StatelessWidget {
   NewCategoryScreen({Key? key}) : super(key: key);

   NewCategoryScreenController newcategoryScreenController = Get.put(NewCategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "New Category", index: 2),

      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Expanded(
                      child: categoryList())

                ],
              ),
            ),
          ),

          Container()
        ],
      ),

    );
  }

  categoryList(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: newcategoryScreenController.category.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> CategoryDetailScreen());
                  },
                  child: Container(
                    //height: 100,
                    width: Get.width,
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
                    child: Image.asset(newcategoryScreenController.category[index]),
                  ),
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
              ),
              SizedBox(height: 10,),
            ],
          );
        },
      ),
    );
  }
}
