import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/Home/HomeState.dart';

import '../../layout/Home/cubitHome.dart';

class EditProfile extends StatelessWidget {
  var namecontoler = TextEditingController();
  var biocontoler = TextEditingController();
  var Phonecontoler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var modelll = CubitHome.get(context).userModel;
    namecontoler.text = modelll!.name!;
    biocontoler.text = modelll.bio!;
    Phonecontoler.text = modelll.phone!;

    return BlocConsumer<CubitHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        File? profileimage = CubitHome.get(context).profileimage;
        File? coverimage = CubitHome.get(context).Coverimage;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            title: Text(
                'Edit profile',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            titleSpacing: 2.0,
            actions: [
              TextButton(
                onPressed: () {
                  CubitHome.get(context).UpdateUser(name: namecontoler.text,
                      phone: Phonecontoler.text,
                      bio: biocontoler.text,
                      );

                },
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Profile picture',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 70.0,
                            backgroundImage: (profileimage == null)
                                ? NetworkImage('${modelll.image}')
                                : FileImage(File(profileimage.path))
                                    as ImageProvider,
                          ),
                          IconButton(
                            onPressed: () {
                              CubitHome.get(context).GetImage();
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey.shade500,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(CubitHome.get(context).profileimage!=null)
                    Row(
                    children: [
                      Expanded(
                        child: TextButton(onPressed: ()
                            {
                              CubitHome.get(context).uploadimage(name: namecontoler.text,
                                  phone: Phonecontoler.text,
                                  bio: biocontoler.text);
                            }, child:Column(
                          children: [
                            Text(
                                'Upload photo'
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            if(state is ProfileUploadImageloading)
                              LinearProgressIndicator(),

                          ],
                        )),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Colors.grey.shade500,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cover photo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: (coverimage == null)
                                ? NetworkImage('${modelll.cover}')
                                : FileImage(File(coverimage.path))
                                    as ImageProvider,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                          IconButton(
                            onPressed: () {
                               CubitHome.get(context).GetImageCover();

                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey.shade500,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(CubitHome.get(context).Coverimage!=null)

                    Row(
                    children: [
                      Expanded(
                        child: TextButton(onPressed: ()
                        {
                          CubitHome.get(context).uploadCoverimage(name: namecontoler.text,
                              phone: Phonecontoler.text,
                              bio: biocontoler.text);

                        }, child:Column(
                          children: [
                            Text(
                                'Upload cover'
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            if(state is CoverUploadImageloading)
                            LinearProgressIndicator(),
                          ],
                        ) ),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: TextFormField(
                        controller: namecontoler,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: TextFormField(
                        controller: Phonecontoler,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: TextFormField(
                        controller: biocontoler,
                        decoration: InputDecoration(
                          labelText: 'Bio',
                          prefixIcon: Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
