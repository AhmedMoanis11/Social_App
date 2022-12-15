import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/assets/icons.dart';

import '../models/UserModel.dart';
import '../layout/Home/cubitHome.dart';

class UserSc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            child: ListView.separated(
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
          ),
        ],
      ),
    );
  }
  Widget BuildChat(UserModel model,context) => Padding(
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
  );

}
