import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/contants/user_details.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/blog_detail_screen_controller/blog_detail_controller.dart';

class BlogDetailsViewModule extends StatelessWidget {
  BlogDetailsViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<BlogDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    '${ApiUrl.ApiMainPath}${screenController.blogImage}',
                  ),
                  fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  screenController.date!.value,
                  style: TextStyle(
                      fontSize: 13
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              screenController.blogTitle!.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Html(
                data: screenController.blogContent!.value
            ),
          ),
          SizedBox(height: 10),
        ],
      );
  }
}


class BlogCommentModule extends StatelessWidget {
  BlogCommentModule({Key? key}) : super(key: key);
  final screenController = Get.find<BlogDetailController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /*UserDetails.isUserLoggedIn == true ? */blogFields()/* : Container()*/,
        ],
      ),
    );
  }

  Widget blogFields() {
    return Form(
      key: screenController.formKey,
      child: TextFormField(
        controller: screenController.commentController,
        keyboardType: TextInputType.emailAddress,
        decoration: formInputDecoration(hintText: 'Type Comment', radius: 30),
        validator: (value) => FieldValidator().validateComment(value!),
      ),
    );
  }


}

