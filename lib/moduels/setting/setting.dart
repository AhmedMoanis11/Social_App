import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/setting/profile.dart';

import '../../layout/Login/LoginScreen.dart';

class SettingSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var modelll = CubitHome.get(context).userModel;
    return BlocConsumer<CubitHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileSc()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                            '${modelll!.image}',
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${modelll.name}',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.9),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                              Text(
                                '${modelll.bio}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 3.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'All shortcut',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.group_solid,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Groups',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dynamic_feed_outlined,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Feeds',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.person_2_fill,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Friends',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.shopping_cart,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Market',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'saved',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ondemand_video_sharp,
                            size: 35.0,
                            color: Colors.deepPurple.shade400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'videos',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 60.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: TextButton(
                    onPressed: () {},
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginSc()),
                            (route) => false);
                      },
                      child: Text(
                          'log out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//TextButton(onPressed: ()
//           {
//             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginSc()), (route) => false);
//
//           }, child: Text(
//             'Log out',
//             style: TextStyle(
//               color: Colors.blue,
//             ),
//           ),),
