import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
 //dynamic article;
   Description({Key key,
    //this.article

        })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('artical',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,centerTitle: true,elevation: 5,  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),),
        backgroundColor: Colors.white,
       // appBar: AppBar(),
        body: Container(
          child: ListView(children: [
            Container(
                height: 250,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child:CachedNetworkImage(
                    imageUrl:'urlToImage',
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
                )),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                child: Text('Sport', style: TextStyle(fontSize: 24),)),

            SizedBox(height: 15),

          ]),
        ),
      ),
    );
  }
}