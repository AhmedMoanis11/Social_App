import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/layout/Login/CubitLogin.dart';
import 'package:social_app/layout/regist/Registor.dart';
import 'package:social_app/shared/SharedPre.dart';
import 'package:social_app/layout/mainSocial.dart';
import 'package:social_app/layout/Login/stateLogin.dart';

class LoginSc extends StatelessWidget {

  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  bool Ispass = true;
  var keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CubitSc(),
      child: BlocConsumer<CubitSc,SocialApp>(
        listener: (context,state)
        {
          if(state is onErrorLogin)
            {
              Fluttertoast.showToast(
                  msg: state.error,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          if(state is onsucessLogin)
            {

              CasheHelper.saveData(
                  key: 'uId',
                  value:state.uId
              ).then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SocialHome()), (route) => false);
              });
            }

        }
        ,builder: (context,state)
        {
          return Scaffold(

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
                        Text(
                          'Tahawer',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'Login now to Communicate with friends',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: emailcontroller,
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
                            obscureText: CubitSc.get(context).shown,
                            controller: passcontroller,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  CubitSc.get(context).isshow,
                                ),
                                onPressed: () {
                                  CubitSc.get(context).PasswordShow();
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
                          color: Colors.deepPurple.shade300,
                          child: TextButton(
                            onPressed: () {
                              CubitSc.get(context).GetLogin(
                                  email: emailcontroller.text,
                                  password: passcontroller.text);
                              if (keyform.currentState!.validate()) {
                                print(emailcontroller.text);
                                print(passcontroller.text);
                              }

                            },
                            child: Text(
                              'Login',
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
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Registor()));

                              },
                              child: Text(
                                'Regist',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple.shade400,

                                ),
                              ),
                            ),
                          ],
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
