import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/MessageModel.dart';
import 'package:social_app/models/PostModel.dart';
import 'package:social_app/layout/Home/HomeState.dart';
import 'package:social_app/layout/mainSocial.dart';
import 'package:social_app/moduels/chat%20screen/chat.dart';
import 'package:social_app/shared/constense.dart';
import 'package:social_app/moduels/feeds.dart';
import 'package:social_app/moduels/notification.dart';
import 'package:social_app/moduels/user.dart';
import 'package:firebase_storage/firebase_storage.dart' as Firebase_Storage;

import '../../models/UserModel.dart';

class CubitHome extends Cubit<HomeState> {
  CubitHome() : super(IntialStateHome());

  static CubitHome get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getDataHome() {
    emit(OnLoadingStateHome());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data()!);
      userModel = UserModel.fromjason(value.data()!);
      emit(OnSucessStateHome());
    }).catchError((e) {
      print(e.toString());
      emit(OnErrorStateHome(e.toString()));
    });
  }

  List<Widget> screen = [
    SocialHome(),
    Chat(),
    Feeds(),
    NotificationSc(),
    UserSc(),
  ];
  File? profileimage;
  var piker = ImagePicker();

  Future GetImage() async {
    final Pickerfile = await piker.pickImage(
      source: ImageSource.gallery,
    );
    if (Pickerfile != null) {
      profileimage = File(Pickerfile.path);
      print(Pickerfile.path);
      emit(ProfileImageSucess());
    } else {
      print('No image selected');
      emit(ProfileImageError());
    }
  }

  File? Coverimage;
  var pikerCover = ImagePicker();

  Future GetImageCover() async {
    final PickerfileCover = await pikerCover.pickImage(
      source: ImageSource.gallery,
    );
    if (PickerfileCover != null) {
      Coverimage = File(PickerfileCover.path);
      print(PickerfileCover.path);
      emit(CoverImageSucess());
    } else {
      print('No image selected');
      emit(CoverImageError());
    }
  }

  void uploadimage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(ProfileUploadImageloading());
    Firebase_Storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileimage!.path)
        .pathSegments
        .last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('value isssssssssssssssssssssssssssss');
        UpdateUser(name: name, phone: phone, bio: bio, image: value);
        print(value);
        emit(ProfileUploadImageSucess());
      }).catchError((e) {
        print(e.toString());
        emit(ProfileUploadImageError());
      });
    }).catchError((e) {
      print(e.toString());
      emit(ProfileUploadImageError());
    });
  }

  void uploadCoverimage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(CoverUploadImageloading());
    Firebase_Storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(Coverimage!.path)
        .pathSegments
        .last}')
        .putFile(Coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('value isssssssssssssssssssssssssssss');
        UpdateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
        print(value);
        emit(CoverUploadImageSucess());
      }).catchError((e) {
        print(e.toString());
        emit(CoverUploadImageError());
      });
    }).catchError((e) {
      print(e.toString());
      emit(CoverUploadImageError());
    });
  }

  UpdateUser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: userModel?.email,
      uId: userModel?.uId,
      image: image ?? userModel?.image,
      cover: cover ?? userModel?.cover,
      bio: bio,
      IsEmailVerify: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      getDataHome();
    }).catchError((e) {
      print(e.toString());
      emit(SocialUpdateUserError());
    });
  }

  ///////////////////////////////////////
  //CreatePost//'

  File? Postimage;
  var Postpiker = ImagePicker();

  Future GetPostImage() async {
    final Pickerfile = await Postpiker.pickImage(
      source: ImageSource.gallery,
    );
    if (Pickerfile != null) {
      Postimage = File(Pickerfile.path);
      print(Pickerfile.path);
      emit(PostImageSucess());
    } else {
      print('No image selected');
      emit(PostImageError());
    }
  }

  void removePostimage() {
    Postimage = null;
    emit(RemovePostImage());
  }

  void UploadPost({
    required String dateTime,
    required String Text,
  }) {
    emit(CreatePostLoading());
    Firebase_Storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri
        .file(Postimage!.path)
        .pathSegments
        .last}')
        .putFile(Postimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('value isssssssssssssssssssssssssssss');
        print(value);
        CreatePost(
          dateTime: dateTime,
          Text: Text,
          PostImage: value,
        );
        emit(CreatePostSucess());
      }).catchError((e) {
        print(e.toString());
        emit(CreatePostError());
      });
    }).catchError((e) {
      print(e.toString());
      emit(CreatePostError());
    });
  }

  CreatePost({
    required String dateTime,
    required String Text,
    String? PostImage,
  }) {
    PostModel postModel = PostModel(
      name: userModel!.name,
      uId: userModel?.uId,
      image: userModel?.image,
      dateTime: dateTime,
      Text: Text,
      PostImage: PostImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) {
      emit(CreatePostSucess());
    }).catchError((e) {
      print(e.toString());
      emit(CreatePostError());
    });
  }

  List<PostModel> postmodel = [];
  List<String> PostId = [];
  List<int> Likes = [];
  List<int> Comment = [];

  // Future<void> GetDataPost() async {
  //   emit(OnLoadingGetPostStateHome());
  //
  //
  //  return await FirebaseFirestore.instance.collection('posts').get().then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection('Likes').get().then((value) {
  //         Likes.add(value.docs.length);
  //         PostId.add(element.id);
  //         postmodel.add(PostModel.fromjason(element.data()));
  //       });
  //
  //     });
  //     emit(OnSucessGetPostStateHome());
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(OnErrorGetPostStateHome(e.toString()));
  //   });
  // }
  Future<void> GetDataPost() async {
    postmodel.clear();
    PostId.clear();
    emit(OnLoadingGetPostStateHome());


   await FirebaseFirestore.instance.collection('posts').get().then((value)async {

      postmodel.clear();
      PostId.clear();
      value.docs.forEach((element)async {
      await element.reference.collection('Likes').get().then((value) {

      Likes.add(value.docs.length);
      PostId.add(element.id);
      postmodel.add(PostModel.fromjason(element.data()));
      });

      });
      Timer(Duration(seconds: 1), () {
        emit(OnSucessGetPostStateHome());
      });
      }).catchError((e) {
      print(e.toString());
      emit(OnErrorGetPostStateHome(e.toString()));
    });
  }



  // void GetDataComment() {
  //   emit(GetDatacommentLoading());
  //   FirebaseFirestore.instance.collection('posts').get().then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection('comments').get().then((value) {
  //         Comment.add(value.docs.length);
  //         PostId.add(element.id);
  //         postmodel.add(PostModel.fromjason(element.data()));
  //       }).catchError((e) {
  //         print(e.toString());
  //       });
  //     });
  //     emit(GetDatacommentSucess());
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(GetDatacommentError(e.toString()));
  //   });
  // }

  // void GetComment(String PostId) {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(PostId)
  //       .collection('comments')
  //       .doc(userModel!.uId)
  //       .set({
  //     'comments': true,
  //   }).then((value) {
  //     emit(OnSucessCommentPostStateHome());
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(OnErrorCommentPostStateHome(e.toString()));
  //   });
  // }

  void GetLikes(String PostId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(PostId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({'Likes': true}).then((value) {
      emit(OnSucessLikePostStateHome());
    }).catchError((e) {
      emit(OnErrorLikePostStateHome(e.toString()));
    });
  }

  List<UserModel> users = [];

  void GetAllUsers() {
    emit(GetAllUsreLoading());
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
       //+ if (element.data()['uId'] != userModel!.uId)
          users.add(UserModel.fromjason(element.data()));
      });
      emit(GetAllUsreSucess());
    }).catchError((e) {
      print(e.toString());
      emit(GetAllUsreError(e.toString()));
    });
  }
  final messagecontroller = TextEditingController();
  void SendMessage({
    required String receiverId,
    required String datetime,
    required String text,
  }) {
    MessageModel messageModel = MessageModel(
      receiverId: receiverId,
      senderId: userModel!.uId,
      datetime: datetime,
      text: text,
    );
    // الشات يتاعي
    messagecontroller.clear();
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap()).then((value) {
      emit(SendMessageSucess());
    }).catchError((e) {
      print(e.toString());
      emit(SendMessageError());
    });
    // الشات بتاع الرسيفر
    ///////////////////////////////////////////////
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(messageModel.toMap()).then((value) {
      emit(SendMessageSucess());
    }).catchError((e) {
      print(e.toString());
      emit(SendMessageError());
    });
  }

   List<MessageModel> messages=[] ;

  void GetMessages({
    required String receiverId,

  }) {

    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId).collection('messages').
        orderBy('datetime').
        snapshots(). // استخدمت snapshots عشان هي stream ى الستريم عباره عن طابور من الفيوتشر
        listen((event) {
      messages.clear();
          event.docs.forEach((element) {
            messages.add(MessageModel.fromjason(element.data()));


          });
          emit(GetAllMessageSucess());

    });
  }
}

// /data/user/0/com.example.social_app/cache/image_picker6830141639051653187.jpg
