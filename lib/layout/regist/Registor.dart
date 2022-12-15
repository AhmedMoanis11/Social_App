import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/regist/stateRegistor.dart';

import '../Login/CubitLogin.dart';
import 'CubitRegistor.dart';
import '../mainSocial.dart';

class Registor extends StatelessWidget {
  var keyform = GlobalKey<FormState>();
  var passcontrollerRegist=TextEditingController();
  var namecontrollerRegist=TextEditingController();
  var phonecontrollerRegist=TextEditingController();
  var emailcontrollerRegist=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CubitRegist(),
      child: BlocConsumer<CubitRegist,RegistState>(
        listener: (context,state)
        {
          if(state is OnSucessCreateUserRegist)
            {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SocialHome()), (route) => false);
            }

        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: keyform,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                          child: Text(
                            'Register',
                            style: TextStyle(

                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Create your account , it\'s free and only taske a minutes ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: namecontrollerRegist,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your name";
                              }

                              return null;
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(20.0),
                            color: Colors.grey.shade100,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: phonecontrollerRegist,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.phone,
                              ),

                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Phone number';
                              }
                              return null;
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(10.0),
                            color: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: emailcontrollerRegist,
                            decoration: InputDecoration(
                              hintText: 'email address',
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your email";
                              }

                              return null;
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(20.0),
                            color: Colors.grey.shade100,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: CubitRegist.get(context).shown,
                            controller: passcontrollerRegist,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility,
                                ),
                                onPressed: () {
                                  CubitRegist.get(context).PasswordShow();
                                },
                              ),
                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(10.0),
                            color: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        Container(
                          width: double.infinity,
                          child: TextButton(onPressed:()
                          {

                          }, child:Row(
                            children: [
                              IconButton(onPressed: ()
                              {

                              }, icon:Icon(
                                Icons.check,
                              ),
                              ),
                              SizedBox(width: 15.0,),
                              Text(
                                'I accept the terms of use & privacy ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          ),
                        ),






                        Container(
                          width: double.infinity,
                          color: Colors.deepOrange,
                          child: TextButton(
                            onPressed: () {
                              CubitRegist.get(context).Registor(
                                  name: namecontrollerRegist.text,
                                  phone: phonecontrollerRegist.text,
                                  email: emailcontrollerRegist.text,


                                  password: passcontrollerRegist.text
                              );

                              if (keyform.currentState!.validate()) {
                                print(emailcontrollerRegist.text);
                                print(passcontrollerRegist.text);
                                print(emailcontrollerRegist.text);
                                print(passcontrollerRegist.text);
                              }
                            },
                            child: Text(
                              'Regist',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
