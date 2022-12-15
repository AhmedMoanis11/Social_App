import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/MessageModel.dart';
import 'package:social_app/models/UserModel.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/cubitHome.dart';

class ChatDetails extends StatelessWidget {

  UserModel? userModel;

  ChatDetails({this.userModel});


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        CubitHome.get(context).GetMessages(receiverId: userModel!.uId!);
        return BlocConsumer<CubitHome, HomeState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple.shade300,
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    ConditionalBuilder(
                      condition: userModel!.image != null,
                      builder: (context) =>
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                '${userModel!.image}'),
                          ),
                      fallback: (context) =>
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/206/206853.png'),
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
                                '${userModel!.name}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: CubitHome
                    .get(context)
                    .messages
                    .length > 0,
                builder: (context) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(

                                itemBuilder:(context,index)
                                {
                                  var messagess=CubitHome.get(context).messages[index];
                                  if(userModel!.uId==messagess.receiverId)
                                    return buildmymessage(messagess);

                                  return buildmessage(messagess);

                                }
                                , separatorBuilder:(context,index)
                                {
                                  return SizedBox(
                                    height: 5.0,
                                  );
                                }
                                , itemCount:CubitHome.get(context).messages.length
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadiusDirectional.circular(
                                  15.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: CubitHome.get(context).messagecontroller,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '    Message...',
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    CubitHome.get(context).SendMessage(
                                        receiverId: userModel!.uId!
                                        ,
                                        datetime: DateFormat('yyyy-mm-hh-ss')
                                            .format(DateTime.now())
                                        ,
                                        text:  CubitHome.get(context).messagecontroller.text
                                    );
                                  }
                                  , child: Icon(
                                  Icons.send,

                                ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                fallback: (context) =>
                BuildDefaultMessage(context),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildmymessage(MessageModel model) =>
      Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade200,
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Text(
              '${model.text} ',
            ),
          ),
        ),
      );

  Widget buildmessage(MessageModel model) =>
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Text(
              '${model.text}',
            ),
          ),
        ),
      );
  Widget BuildDefaultMessage(context) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),

          child: Column(
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadiusDirectional.circular(
                      15.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:  CubitHome.get(context).messagecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '    Message...',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        CubitHome.get(context).SendMessage(
                            receiverId: userModel!.uId!
                            ,
                            datetime: DateFormat('yyyy-mm-hh-ss')
                                .format(DateTime.now())
                            ,
                            text:  CubitHome.get(context).messagecontroller.text
                        );
                      }
                      , child: Icon(
                      Icons.send,

                    ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
}
