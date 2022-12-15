import 'package:awesome_icons/awesome_icons.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:social_app/assets/icons.dart';
import 'package:social_app/models/PostModel.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/post.dart';

class HomeeSociall extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var modelll = CubitHome.get(context).userModel;
    var controller = TextEditingController();

    return BlocConsumer<CubitHome, HomeState>(
      listener: (context, state) {
        if(state is OnSucessStateHome )
          {
           CubitHome.get(context).GetDataPost();

          }

      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition:CubitHome.get(context).userModel!=null &&CubitHome.get(context).postmodel.length>0,
          builder: (context) => RefreshIndicator(
            displacement: 80.0,
            color: Colors.deepPurple,
            onRefresh:()async
            {
              CubitHome.get(context).GetDataPost();

            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Post()));
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
                            Container(
                              height: 30,
                              child: Center(
                                child: Text(
                                  '           What\'s on your mind....        ',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey.shade200,
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                          ],
                        ),
                      ) ,
                      // child: ConditionalBuilder(
                      //   condition:CubitHome.get(context).userModel!=null&&CubitHome.get(context).postmodel.length>0,
                      //   builder:(context)=> Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 25.0,
                      //           backgroundImage: NetworkImage(
                      //             '${modelll!.image}',
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 20.0,
                      //         ),
                      //         Container(
                      //           height: 30,
                      //           child: Center(
                      //             child: Text(
                      //               '           What\'s on your mind....        ',
                      //               style: TextStyle(
                      //                 fontSize: 15.0,
                      //               ),
                      //             ),
                      //           ),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20.0),
                      //             color: Colors.grey.shade200,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 40.0,
                      //         ),
                      //       ],
                      //     ),
                      //   ) ,
                      //   fallback: (context)=>CircularProgressIndicator(),
                      //
                      // ),
                    ),
                  ),


                  ConditionalBuilder(
                    condition: CubitHome.get(context).postmodel!=null&&modelll!=null,
                    builder:(context)=>  ListView.separated(
                        shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) {
                          return BuildPost(CubitHome.get(context).postmodel[index],
                              context, index);
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 2.0,
                            width: 2.0,
                            color: Colors.grey.shade400,
                          );
                        },
                        itemCount: CubitHome.get(context).postmodel.length),
                    fallback:(context)=>CircularProgressIndicator() ,

                  ),


                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget BuildPost(
          PostModel model, context, index) =>
      Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.image}'),
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
                              '${model.name}',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            SizedBox(),
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '${model.Text}',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              // Wrap(
              //   children: [
              //     MaterialButton(
              //       onPressed: () {},
              //       minWidth: 1.0,
              //       padding: EdgeInsets.zero,
              //       child: Text(
              //         '#software',
              //         style: TextStyle(
              //           color: Colors.blue,
              //         ),
              //       ),),
              //     SizedBox(
              //       height: 1.0,
              //       width: 5.0,),
              //     MaterialButton(
              //       onPressed: () {},
              //       minWidth: 1.0,
              //       padding: EdgeInsets.zero,
              //       child: Text(
              //         '#software_development',
              //         style: TextStyle(
              //           color: Colors.blue,
              //         ),
              //       ),),
              //     SizedBox(
              //       height: 1.0,
              //       width: 5.0,),
              //     MaterialButton(
              //       onPressed: () {},
              //       minWidth: 1.0,
              //       padding: EdgeInsets.zero,
              //       child: Text(
              //         '#flutter',
              //         style: TextStyle(
              //           color: Colors.blue,
              //         ),
              //       ),),
              //
              //
              //   ],
              // ),
              SizedBox(
                height: 10.0,
              ),
              if (model.PostImage != '')
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${model.PostImage}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // CubitHome.get(context).GetLikes(
                            //     CubitHome.get(context).PostId[index]);
                          },
                          icon: Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                            size: 18.0,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text('5'),

                        // Text(
                        //
                        //   '${CubitHome.get(context).Likes[index-1]}',
                        //   style: TextStyle(
                        //     color: Colors.black.withOpacity(0.4),
                        //   ),
                        // ),
                        // ConditionalBuilder(
                        //   condition: CubitHome.get(context).Likes.length > 0,
                        //   builder: (context) =>  Text(
                        //
                        //     '${CubitHome.get(context).Likes[index]}',
                        //     style: TextStyle(
                        //       color: Colors.black.withOpacity(0.4),
                        //     ),
                        //   ),
                        //   fallback: (context) => Text('5'),
                        // ),



                      ],
                    ),
                    onTap: () {},
                  ),
                  Spacer(),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            // CubitHome.get(context).GetComment(
                            //     CubitHome.get(context).PostId[index]);
                          },
                          icon: Icon(
                            CupertinoIcons.chat_bubble_fill,
                            color: Colors.grey,
                            size: 18.0,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          '43',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        // Text('55555'),
                        //
                        // ConditionalBuilder(
                        //   condition: CubitHome.get(context).Comment.length > 0,
                        //   builder: (context) =>  Text(
                        //     '${CubitHome.get(context).Comment[index]}',
                        //     style: TextStyle(
                        //       color: Colors.black.withOpacity(0.4),
                        //     ),
                        //   ),
                        //   fallback: (context) => Text('55555'),
                        // ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '5 ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 5.0,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10.0,
              ),

              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        '${model.image}',
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        //controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Write a comment',
                          hintStyle: TextStyle(
                            fontSize: 13.0,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // CubitHome.get(context).GetComment(
                              //     CubitHome.get(context).PostId[index]);
                            },
                            icon: Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20.0),
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        elevation: 15.0,
        margin: EdgeInsets.symmetric(
          horizontal: 0.8,
          vertical: 0.8,
        ),
      );
}
