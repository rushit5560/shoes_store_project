import 'package:flutter/material.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Notification"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: notificationList(),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  notificationList() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      separatorBuilder: (ctx,ind){
        if(ind != 0){
        }
          return ind != 10 ? Divider(color: Colors.grey) : SizedBox();
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
             index == 0 ? const SizedBox(height: 15) : SizedBox(),
            
            Container(
              margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: AssetImage(
                                Images.ic_user,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John will deliver your order",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Last Week",
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
