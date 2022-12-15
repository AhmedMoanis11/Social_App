import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/layout/Home/cubitHome.dart';

import '../layout/Home/HomeeSocial.dart';
import '../layout/Home/HomeState.dart';
import 'dart:io';


class Post extends StatelessWidget {

  var TextController=TextEditingController();
  var now =DateTime.now();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CubitHome, HomeState>(

      listener: (context, state) {


      },
      builder: (context, state) {
        File? postimage = CubitHome.get(context).Postimage;


        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0
            ),

            child: Column(
              children: [
                if(state is CreatePostLoading)
                  LinearProgressIndicator(),
                if(state is CreatePostLoading)
                  SizedBox(
                    height: 10.0,
                  ),


                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          '${CubitHome
                              .get(context)
                              .userModel!
                              .image}'
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${CubitHome
                                  .get(context)
                                  .userModel!
                                  .name}',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                    Spacer(),
                    TextButton(onPressed:()
                    {

                      if(CubitHome.get(context).Postimage==null)
                      {
                        CubitHome.get(context).CreatePost(
                            dateTime:DateFormat('yyyy-MM-dd-hh-mm').format(DateTime.now()),
                            Text: TextController.text
                        );
                      }
                      else
                      {
                        CubitHome.get(context).UploadPost(
                            dateTime:DateFormat('yyyy-MM-dd-hh-mm').format(DateTime.now()),
                            Text: TextController.text
                        );
                      }






                    }
                      , child: Text(
                        'Post',
                        style: TextStyle(
                            color: Colors.deepPurple.shade400,
                            fontSize: 18
                        ),
                      ),),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: TextFormField(
                    controller: TextController,
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind... ',
                      hintStyle: TextStyle(
                        fontSize: 25.0,

                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(postimage!=null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image(
                        image: FileImage(File(postimage.path))
                        as ImageProvider,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      IconButton(
                        onPressed: () {
                          CubitHome.get(context).removePostimage();
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey.shade500,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        CubitHome.get(context).GetPostImage();
                      },
                      child: Row(
                        children: [
                          TextButton(onPressed: () {


                          }, child: Icon(
                            Icons.photo_camera_back,
                            color: Colors.deepPurple.shade400,
                          ),
                          ),
                          Text(
                            'Add photo',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.deepPurple.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 90.0,
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          TextButton(onPressed: () {

                          }, child: Icon(
                            Icons.tag,
                            color: Colors.deepPurple.shade400,
                          ),
                          ),
                          Text(
                            ' tags',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.deepPurple.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}
