import 'package:flutter/material.dart';


class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text('General Setting',
              style: TextStyle(color: Colors.grey[400], fontSize: 16)
          ),
          SizedBox(
            height: 24,
          ),

          // Row(
          //   children: [
          //     Container(
          //       width: 35,
          //       height: 35,
          //       decoration: BoxDecoration(
          //         color: PrimaryColor,
          //         borderRadius: BorderRadius.circular(7),
          //       ),
          //       child: Icon(
          //         Icons.brightness_2_outlined,
          //         color: Colors.grey[400],
          //         size: 22,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Text('Dark Mode', style: TextStyle(color: TextColor,fontSize: 16)),
          //
          //
          //   ],
          // ),
        ],
      ),
    );
  }
}
