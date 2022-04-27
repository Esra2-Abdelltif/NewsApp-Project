import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/modules/DetialsScreen/details_movies.dart';
import 'package:newsapp_project/shared/Constans/constans.dart';


Widget BuildNewsItems({article,context})=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
          height: 120,
          width: 120,
        child:CachedNetworkImage(
          imageUrl:'${article['urlToImage']}',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error,color: Color(0xFF8D8E98)),
        ),

      ),
      SizedBox(width: 10.0,),

      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text ('${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              SizedBox(height: 5.0,),
              // SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined,color: Colors.grey[400]),
                  SizedBox(width: 7.0,),
                  Text ('${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 13 , fontWeight: FontWeight.w700),)
                ],),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                    text: 'Read More..',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,),
                     recognizer: TapGestureRecognizer()..onTap = () {
                      NavigateTo(router: Description(),context: context);

                    }),

              ),


            ],
          ),
        ),
      ),
    ],
  ),
);
Widget defulutTextFormFild ({@required TextEditingController controller, @required Function  validator, @required TextInputType type, @required String label, Color BorderSideColor:Colors.deepOrange, @required IconData prefixIcon})=>TextFormField(
  validator:validator(),
  controller:controller,
  keyboardType: type,
  cursorColor: Colors.blue,
  style: TextStyle(
      color: Colors.blue
  ),
  decoration: InputDecoration(

    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: BorderSideColor ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    labelText: label,
   // labelStyle: TextStyle(color: Colors.deepPurple,),
    prefixIcon: Icon(prefixIcon,color: Colors.deepOrange,),
    border: OutlineInputBorder(),


  ),

);

