
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/UserModel.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/chat%20screen/Chat_Details.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

          body: ConditionalBuilder(
            condition: CubitHome.get(context).users.length > 0,
            builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BuildChat(CubitHome.get(context).users[index],context);
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 2.0,
                  width: 2.0,
                  color: Colors.grey.shade400,
                );
              },
              itemCount: CubitHome.get(context).users.length,
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget BuildChat(UserModel model,context) => InkWell(
        onTap: () {
         Navigator.push(context,
         MaterialPageRoute(builder: (context)=>ChatDetails(
             userModel: model,
         ),
         ),
         );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConditionalBuilder(
                condition: model.image != null,
                builder: (context) => CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                fallback: (context) => CircleAvatar(
                  radius: 25.0,
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
                        Spacer(),
                        Text(
                          '${DateFormat('yyyy-mm-hh-ss').format(DateTime.now())}',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey.shade600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
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
      );
}
