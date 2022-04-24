import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final Map artical;
  // final String name, posterurl,title;

  const Description({Key key,
    this.artical
        // this.name,
        // this.posterurl,
        // this.title
        })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('kkkk',style: TextStyle(color: Colors.black),),
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
                  child: Image.network('${'https://www.albayan.ae/polopoly_fs/1.4418558.1650469664!/image/image.jpg'}',
                    fit: BoxFit.fill,
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