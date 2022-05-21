import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp_project/modules/WebView/WebView.dart';
import 'package:newsapp_project/shared/Constans/constans.dart';


Widget BuildNewsItems({article,context,Color BuildTaskColor })=>Padding(
  padding: const EdgeInsets.all(10),
  child: Conditional.single(
    context: context,
    conditionBuilder: (BuildContext context) =>article['urlToImage'] != null,
      widgetBuilder:  (BuildContext context){
        return InkWell(
          onTap: (){NavigateTo(router:WebViewScreen(article['url']),context: context);},
          child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                 color: BuildTaskColor ,boxShadow: [
                  BoxShadow(
                    color: Color(0xFF8D8E98),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
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
                            SizedBox(height: 7.0,),
                            // SizedBox(height: 20.0),
                            Row(
                              children: [
                                Text ('${article['publishedAt']}',
                                  style: TextStyle(color: Colors.grey[400], fontSize: 13 , fontWeight: FontWeight.w700),)
                              ],),
                            SizedBox(height: 10,),
                            RichText(
                              text: TextSpan(
                                  text: 'Read More..',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    NavigateTo(router:WebViewScreen(article['url']),context: context);

                                  }),

                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    fallbackBuilder: (BuildContext context){
      return InkWell(
        onTap: (){NavigateTo(router:WebViewScreen(article['url']),context: context);},
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
            color: BuildTaskColor ,boxShadow: [
              BoxShadow(
                color: Color(0xFF8D8E98),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    width: double.infinity,
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

                            Text ('${article['publishedAt']}',
                              style: TextStyle(color: Colors.grey[400], fontSize: 13 , fontWeight: FontWeight.w700),)
                          ],),
                        SizedBox(height: 10,),
                        RichText(
                          text: TextSpan(
                              text: 'Read More..',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                NavigateTo(router:WebViewScreen(article['url']),context: context);

                              }),

                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },

  ),
);



Widget defulutTextFormFild ({@required TextEditingController controller, @required Function  validator, @required TextInputType type, @required String label, Color BorderSideColor:Colors.deepOrange, @required IconData prefixIcon})=>
    TextFormField(
      validator:validator(),
      controller:controller,
       keyboardType: type,
      style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         labelText: label,
         prefixIcon: Icon(prefixIcon,color: Colors.deepOrange,),
  ),

);

