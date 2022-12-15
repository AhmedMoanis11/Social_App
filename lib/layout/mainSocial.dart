import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/HomeeSocial.dart';
import 'package:social_app/moduels/chat%20screen/chat.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/feeds.dart';
import 'package:social_app/moduels/notification.dart';
import 'package:social_app/moduels/post.dart';
import 'package:social_app/moduels/search.dart';
import 'package:social_app/moduels/setting/setting.dart';
import 'package:social_app/moduels/user.dart';

class SocialHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome,HomeState>(
      listener: (context,state)
      {

      },builder: (context,state)
      {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple.shade200,
              title: Text(
                'Tahawer',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(onPressed: ()
                    {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                    }, child:Icon(
                  Icons.search,
                  color: Colors.white,
                ), ),
                TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationSc()));
                }, child:Icon(
                  Icons.notifications,
                  color: Colors.white,
                ), ),



              ],
              bottom: TabBar(
                indicatorColor: Colors.white,

                tabs:[
                  Tab(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                    ),

                  ),

                  Tab(
                    icon: Icon(
                     CupertinoIcons.person_2_fill,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.post_add,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],

              ),
            ),
            body: TabBarView(
              children: [
               HomeeSociall(),
               UserSc(),
               Post(),
                Chat(),
               SettingSc()

              ],

            ),
          ),
        );
      },
    );
  }
}
//ConditionalBuilder(
//             condition: CubitHome.get(context).model!=null,
//             builder: (context)=>Column(
//
//
//               children: [
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 Container(
//                   color: Colors.yellow.shade400,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.warning,
//                         ),
//                         SizedBox(width: 15.0,),
//                         Text(
//                           'Please Verify your email',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Spacer(),
//                         Container(
//                           color: Colors.blue,
//                           child: MaterialButton(
//
//                             onPressed: ()
//                             {
//                               if( CubitHome.get(context).model!.IsEmailVerify! !=true)
//                                 {
//                                   FirebaseAuth.instance.currentUser!.sendEmailVerification(
//
//                                   ).then((value) {
//                                     Fluttertoast.showToast(
//                                         msg: 'check your mail',
//                                         toastLength: Toast.LENGTH_LONG,
//                                         gravity: ToastGravity.BOTTOM,
//                                         timeInSecForIosWeb: 5,
//                                         backgroundColor: Colors.green,
//                                         textColor: Colors.white,
//                                         fontSize: 16.0
//                                     );
//
//
//                                   }).catchError((e)
//                                   {
//                                     print(e.toString());
//                                   });
//
//                                 }
//
//                             },
//                             child: Text(
//                               'Send ',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             fallback: (context)=>Center(child: CircularProgressIndicator()),
//           ),