import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        children: [
          Image(
            width: 70.0,
             height: 70.0,
             fit: BoxFit.cover,
               image:AssetImage(
                 'images/PIC3.png',
               ),
             ),


        ],
      ),
    ),
    );
  }
}
