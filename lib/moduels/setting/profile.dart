import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/setting/EditProfile.dart';

class ProfileSc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var modelll=CubitHome.get(context).userModel;
    return BlocConsumer<CubitHome,HomeState>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Align(
                      child: Image(
                        image: NetworkImage(
                          '${modelll!.cover}'
                        ),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius:75,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70.0,
                              backgroundImage: NetworkImage(
                                '${modelll.image}'
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  children: [
                    Text(
                      '${modelll.name}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${modelll.bio}',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 190,
                      height: 50,
                      color: Colors.deepPurple.shade300,
                      child: TextButton(onPressed:()
                      {

                      }, child:Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          SizedBox(

                            width: 15.0,
                          ),
                         TextButton(onPressed:()
                           {

                           }, child:  Text(
                           'Add to your story',
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),),


                        ],
                      ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 162,
                      height: 50,
                      color: Colors.deepPurple.shade300,
                      child: TextButton(onPressed:()
                      {

                      }, child:Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          TextButton(onPressed:()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                            }, child: Text(
                            'Edit profile',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),)


                        ],
                      ),
                      ),

                    ),
                  ),
                ],
              ),

            ],
          ),
        );
      },


    );
  }
}
