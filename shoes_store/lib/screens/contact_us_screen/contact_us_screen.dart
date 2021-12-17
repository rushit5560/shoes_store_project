import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoes_store/common/app_colors.dart';


class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            googleMap(),
            Column(
              children: [
                appBar(),
                SizedBox(height: Get.height/6,),
                Expanded(
                  child: contactForm(),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }

  googleMap(){
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      //markers: _markers,
      //onCameraMove: _onCameraMove,
      initialCameraPosition: _kGooglePlex,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

   appBar(){
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30,)),

          Text("Contact Us",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),

          Container()
        ],
      ),
    );
   }

   contactForm(){
    return Container(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        color: Colors.white
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
              userNameTextField(),
              SizedBox(height: 20,),
              emailTextField(),
            SizedBox(height: 20,),
            subjectTextField(),
            SizedBox(height: 20,),
            commentTextField(),
            SizedBox(height: 20,),
            changeButton()
          ],
        ),
      ),
    );
   }

   userNameTextField(){
     return Container(
       decoration: BoxDecoration(
           border: Border.all(color: Colors.grey.shade200),
           boxShadow: [
             BoxShadow(
                 color: Colors.grey.shade400,
                 blurRadius: 10.0
             )
           ]
       ),
       child: TextFormField(
           keyboardType: TextInputType.emailAddress,
           //controller: signInPasswordFieldController,
           obscureText: true,
           decoration: InputDecoration(
             hintText: "Username",
             //prefixIcon: Icon(icon, color: Colors.black),
             //isDense: true,
             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

   emailTextField(){
     return Container(
       decoration: BoxDecoration(
           border: Border.all(color: Colors.grey.shade200),
           boxShadow: [
             BoxShadow(
                 color: Colors.grey.shade400,
                 blurRadius: 10.0
             )
           ]
       ),
       child: TextFormField(
           keyboardType: TextInputType.emailAddress,
           //controller: signInPasswordFieldController,
           obscureText: true,
           decoration: InputDecoration(
             hintText: "Email Id",
             //prefixIcon: Icon(icon, color: Colors.black),
             //isDense: true,
             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

   subjectTextField(){
     return Container(
       decoration: BoxDecoration(
           border: Border.all(color: Colors.grey.shade200),
           boxShadow: [
             BoxShadow(
                 color: Colors.grey.shade400,
                 blurRadius: 10.0
             )
           ]
       ),
       child: TextFormField(
           keyboardType: TextInputType.emailAddress,
           //controller: signInPasswordFieldController,
           obscureText: true,
           decoration: InputDecoration(
             hintText: "Subject",
             //prefixIcon: Icon(icon, color: Colors.black),
             //isDense: true,
             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

   commentTextField(){
     return Container(
       decoration: BoxDecoration(
           border: Border.all(color: Colors.grey.shade200),
           boxShadow: [
             BoxShadow(
                 color: Colors.grey.shade400,
                 blurRadius: 10.0
             )
           ]
       ),
       child: TextFormField(
           keyboardType: TextInputType.emailAddress,
           //controller: signInPasswordFieldController,
           obscureText: true,
           //maxLines: 5,
           decoration: InputDecoration(
             hintText: "Comment",
             //prefixIcon: Icon(icon, color: Colors.black),
             //isDense: true,
             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

   changeButton(){
     return Container(
       height: 45,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30),
         color: AppColors.colorDarkPink
       ),
       child: Center(
         child: Text("Change", style: TextStyle(
           fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold
         ),),
       ),
     );
   }
}
