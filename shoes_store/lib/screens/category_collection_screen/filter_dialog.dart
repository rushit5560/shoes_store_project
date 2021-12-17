import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {

  RangeValues _currentRangeValues = const RangeValues(0, 8000);


  List<String> brandList = [
    "Airness",
    "Alden",
    "Skechers",
    "British knights",
    "Legea"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBarModule(image: "Filter"),
      body:  Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filter", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                ),),

                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 20, width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black
                    ),
                    child: Center(
                      child: Icon(Icons.close, color: Colors.white,size: 12,),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            Text("Price", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 8000,
              divisions: 10,
              inactiveColor: Colors.white,
              activeColor: Colors.black,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues value) {
                setState(() {
                  _currentRangeValues = value;
                });
              },
            ),

            Text("Size", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
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
            ),
            SizedBox(height: 10,),
            Text("Color", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
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
            ),
            SizedBox(height: 10,),
            Text("Brand", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ListView.builder(
              itemCount: brandList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container(
                  child: Text(brandList[index], style: TextStyle(fontSize: 18),),
                );
              },
            ),
            SizedBox(height: 20,),
            applyButton(),
          ],
        ),
      ),


    );
  }


  applyButton(){
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkPink
      ),
      child: Center(
        child: Text("Apply", style: TextStyle(
            color: Colors.white
        ),),
      ),
    );
  }
}
