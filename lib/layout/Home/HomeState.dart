abstract class HomeState{}

class IntialStateHome extends HomeState{}

class OnLoadingStateHome extends HomeState{}
class OnSucessStateHome extends HomeState{}
class OnErrorStateHome extends HomeState{
  final String error;

  OnErrorStateHome(this.error);

}
/////////////////
class OnLoadingGetPostStateHome extends HomeState{}
class OnSucessGetPostStateHome extends HomeState{}
class OnSucessGetCommentPostStateHome extends HomeState{}
class OnSucessGetLikePostStateHome extends HomeState{}
class OnErrorGetPostStateHome extends HomeState{
  final String error;

  OnErrorGetPostStateHome(this.error);

}
class OnErrorGetCommentPostStateHome extends HomeState{
  final String error;

  OnErrorGetCommentPostStateHome(this.error);

}
class OnErrorGetLikePostStateHome extends HomeState{
  final String error;

  OnErrorGetLikePostStateHome(this.error);

}
class ProfileImageSucess extends HomeState {}
class ProfileImageError extends HomeState {}

class CoverImageSucess extends HomeState {}
class CoverImageError extends HomeState {}

class ProfileUploadImageloading extends HomeState {}
class ProfileUploadImageSucess extends HomeState {}
class ProfileUploadImageError extends HomeState {}

class CoverUploadImageloading extends HomeState {}
class CoverUploadImageSucess extends HomeState {}
class CoverUploadImageError extends HomeState {}

class SocialUpdateUserError extends HomeState{}



class CreatePostSucess extends HomeState{}
class CreatePostLoading extends HomeState{}
class CreatePostError extends HomeState{}
class PostImageSucess extends HomeState {}
class PostImageError extends HomeState {}
class RemovePostImage extends HomeState {}

class OnSucessLikePostStateHome extends HomeState{}
class OnErrorLikePostStateHome extends HomeState{
  final String error;

  OnErrorLikePostStateHome(this.error);

}
class OnSucessCommentPostStateHome extends HomeState{}
class OnErrorCommentPostStateHome extends HomeState{
  final String error;

  OnErrorCommentPostStateHome(this.error);

}
class GetDatacommentLoading extends HomeState{}
class GetDatacommentSucess extends HomeState{}
class GetDatacommentError extends HomeState{
  final String error;

  GetDatacommentError(this.error);


}

class GetAllUsreSucess extends HomeState{}
class GetAllUsreLoading extends HomeState{}
class GetAllUsreError extends HomeState{

  final String error;

  GetAllUsreError(this.error);
}

class SendMessageSucess extends HomeState{}
class SendMessageError extends HomeState{}

class GetAllMessageSucess extends HomeState{}
class GetAllMessageError extends HomeState{}


